// lib/models/actualite.dart
//
// Modèle de données pour le fil d'actualités ECC (JIC, séminaires,
// réunions, annonces nationales...). Collection Firestore "actualites".

import 'package:cloud_firestore/cloud_firestore.dart';

class Actualite {
  final String id;
  final String titre;
  final String description;
  final Timestamp datePublication;
  final String? lienEnSavoirPlus;

  Actualite({
    required this.id,
    required this.titre,
    required this.description,
    required this.datePublication,
    this.lienEnSavoirPlus,
  });

  factory Actualite.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? {};
    return Actualite(
      id: doc.id,
      titre: data['titre'] ?? '',
      description: data['description'] ?? '',
      datePublication: data['datePublication'] ?? Timestamp.now(),
      lienEnSavoirPlus: data['lienEnSavoirPlus'],
    );
  }

  DateTime get date => datePublication.toDate();
}