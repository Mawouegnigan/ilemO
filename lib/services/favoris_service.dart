// lib/services/favoris_service.dart
//
// Gère les paroisses favorites en stockage local sur l'appareil
// (via shared_preferences), en attendant le module Connexion/Inscription
// (Lot 5) qui permettra de lier les favoris à un compte utilisateur.
//
// Stocke simplement la liste des identifiants Firestore des paroisses
// favorites, sous forme de liste de chaînes.

import 'package:shared_preferences/shared_preferences.dart';

class FavorisService {
  static const _cle = 'paroisses_favorites';

  Future<List<String>> getFavorisIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_cle) ?? [];
  }

  Future<bool> estFavori(String paroisseId) async {
    final favoris = await getFavorisIds();
    return favoris.contains(paroisseId);
  }

  /// Ajoute ou retire une paroisse des favoris, et renvoie le nouvel état.
  Future<bool> basculerFavori(String paroisseId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoris = prefs.getStringList(_cle) ?? [];

    final estDejaFavori = favoris.contains(paroisseId);
    if (estDejaFavori) {
      favoris.remove(paroisseId);
    } else {
      favoris.add(paroisseId);
    }

    await prefs.setStringList(_cle, favoris);
    return !estDejaFavori;
  }
}