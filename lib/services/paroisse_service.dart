// lib/services/paroisse_service.dart
//
// Couche d'accès aux données Firestore pour les paroisses.
// Ajout du 28/07/2026 : calcul de distance pour "Autour de moi".
//
// Note technique : ce tri par distance est calculé côté application
// (on récupère toutes les paroisses, puis on calcule/trie en Dart).
// C'est suffisant pour le volume actuel (15 paroisses de test).
// Pour des milliers de paroisses, il faudra migrer vers une requête
// géospatiale Firestore (geohashing, cf. suivi Lot 3) afin de ne
// charger que les paroisses proches, sans tout télécharger.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../models/paroisse.dart';

class ParoisseService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('paroisses');

  /// Flux en temps réel de toutes les paroisses, triées par nom.
  Stream<List<Paroisse>> streamParoisses() {
    return _collection.orderBy('nom').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Paroisse.fromFirestore(doc)).toList(),
        );
  }

  Future<Paroisse?> getParoisseById(String id) async {
    final doc = await _collection.doc(id).get();
    if (!doc.exists) return null;
    return Paroisse.fromFirestore(doc);
  }

  /// Récupère la position actuelle de l'utilisateur, en gérant
  /// les permissions. Lève une exception avec un message clair
  /// si la permission est refusée ou la localisation désactivée.
  Future<Position> getPositionActuelle() async {
    final serviceActif = await Geolocator.isLocationServiceEnabled();
    if (!serviceActif) {
      throw Exception('La localisation est désactivée sur cet appareil.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permission de localisation refusée.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Permission de localisation refusée définitivement. '
        'Activez-la dans les paramètres de l\'application.',
      );
    }

    return Geolocator.getCurrentPosition();
  }

  /// Trie une liste de paroisses par distance croissante par rapport
  /// à une position donnée. Ignore les paroisses sans coordonnées GPS.
  List<MapEntry<Paroisse, double>> trierParDistance(
    List<Paroisse> paroisses,
    Position position,
  ) {
    final avecDistance = paroisses
        .where((p) => p.aDesCoordonnees)
        .map((p) {
          final distanceMetres = Geolocator.distanceBetween(
            position.latitude,
            position.longitude,
            p.latitude!,
            p.longitude!,
          );
          return MapEntry(p, distanceMetres);
        })
        .toList();

    avecDistance.sort((a, b) => a.value.compareTo(b.value));
    return avecDistance;
  }
}