// lib/models/retour.dart
//
// Modèle de données pour un retour/avis sur l'application ilemO.
// Collection Firestore "retours" : écriture publique, lecture admin
// uniquement (voir règles de sécurité Firestore).

import 'package:cloud_firestore/cloud_firestore.dart';

class Retour {
  final String message;
  final int? note; // 1 à 5, optionnel
  final String? nom;
  final String? contact;

  Retour({
    required this.message,
    this.note,
    this.nom,
    this.contact,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'message': message,
      if (note != null) 'note': note,
      if (nom != null && nom!.trim().isNotEmpty) 'nom': nom!.trim(),
      if (contact != null && contact!.trim().isNotEmpty) 'contact': contact!.trim(),
      'dateEnvoi': FieldValue.serverTimestamp(),
    };
  }
}