// lib/services/actualite_service.dart
//
// Couche d'accès aux données Firestore pour le fil d'actualités.

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/actualite.dart';

class ActualiteService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('actualites');

  /// Flux des actualités, les plus récentes en premier.
  Stream<List<Actualite>> streamActualites() {
    return _collection.orderBy('datePublication', descending: true).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => Actualite.fromFirestore(doc)).toList(),
        );
  }
}