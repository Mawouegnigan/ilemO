// lib/models/paroisse.dart
//
// Modèle de données représentant une paroisse, aligné sur la structure
// de la collection Firestore "paroisses". Ajout du 28/07/2026 :
// latitude/longitude pour la fonctionnalité "Autour de moi".

import 'package:cloud_firestore/cloud_firestore.dart';

class Paroisse {
  final String id;
  final String nom;
  final String pays;
  final String region;
  final String sousRegion;
  final String ville;
  final String chargeParoissial;
  final String contact;
  final String? siteWeb;
  final String localisationGoogleMaps;
  final double? latitude;
  final double? longitude;
  final int? jourFete;
  final int? moisFete;

  Paroisse({
    required this.id,
    required this.nom,
    required this.pays,
    required this.region,
    required this.sousRegion,
    required this.ville,
    required this.chargeParoissial,
    required this.contact,
    required this.siteWeb,
    required this.localisationGoogleMaps,
    this.latitude,
    this.longitude,
    this.jourFete,
    this.moisFete,
  });

  factory Paroisse.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return Paroisse(
      id: doc.id,
      nom: data['nom'] ?? '',
      pays: data['pays'] ?? '',
      region: data['region'] ?? '',
      sousRegion: data['sousRegion'] ?? '',
      ville: data['ville'] ?? '',
      chargeParoissial: data['chargeParoissial'] ?? '',
      contact: data['contact'] ?? '',
      siteWeb: data['siteWeb'],
      localisationGoogleMaps: data['localisationGoogleMaps'] ?? '',
      latitude: (data['latitude'] as num?)?.toDouble(),
      longitude: (data['longitude'] as num?)?.toDouble(),
      jourFete: (data['jourFete'] as num?)?.toInt(),
      moisFete: (data['moisFete'] as num?)?.toInt(),
    );
  }

  bool get aDesCoordonnees => latitude != null && longitude != null;
  bool get aDateDeFete => jourFete != null && moisFete != null;

  bool estEnFeteCeMois(int moisActuel) => moisFete == moisActuel;

  static const List<String> _nomsMois = [
    '', 'janvier', 'février', 'mars', 'avril', 'mai', 'juin',
    'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre',
  ];

  String get dateFeteFormatee {
    if (!aDateDeFete) return '';
    return '$jourFete ${_nomsMois[moisFete!]}';
  }
}