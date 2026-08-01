// lib/services/retour_service.dart
//
// Service d'envoi des retours/avis sur l'app. Écriture uniquement,
// aucune lecture n'est exposée côté client.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/retour.dart';

class RetourService {
  final CollectionReference _retoursRef =
      FirebaseFirestore.instance.collection('retours');

  Future<void> envoyerRetour(Retour retour) async {
    await _retoursRef.add(retour.toFirestore());
  }
}