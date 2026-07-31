// lib/services/theme_service.dart
//
// Mémorise la préférence de thème (clair/sombre) de l'utilisateur,
// en stockage local, de la même façon que les favoris.

import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  static const _cle = 'mode_sombre_active';

  Future<bool> getModeSombre() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_cle) ?? false; // clair par défaut
  }

  Future<void> setModeSombre(bool actif) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_cle, actif);
  }
}