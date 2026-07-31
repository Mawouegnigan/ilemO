// lib/services/locale_service.dart
//
// Mémorise la préférence de langue de l'utilisateur (stockage local, même
// principe que ThemeService), et résout la locale à utiliser selon la
// règle : choix explicite > langue du téléphone si supportée > français.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService {
  static const _cle = 'langue_choisie';

  /// Langues gérées par nos propres traductions (AppLocalizations) et,
  /// pour 'yo'/'guw', par les délégués de repli système
  /// (voir lib/l10n/fallback_localizations.dart).
  static const List<Locale> languesSupportees = [
    Locale('fr'),
    Locale('en'),
    Locale('yo'),
    Locale('guw'),
  ];

  static const Locale langueParDefaut = Locale('fr');

  /// Renvoie le code de langue choisi explicitement par l'utilisateur,
  /// ou null si aucun choix n'a encore été fait (auto-détection à utiliser).
  Future<String?> getLangueChoisie() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_cle);
  }

  /// Enregistre le choix explicite de langue. Passer null pour revenir à
  /// l'auto-détection (langue du téléphone).
  Future<void> setLangueChoisie(String? codeLangue) async {
    final prefs = await SharedPreferences.getInstance();
    if (codeLangue == null) {
      await prefs.remove(_cle);
    } else {
      await prefs.setString(_cle, codeLangue);
    }
  }

  /// Détermine la Locale à utiliser pour l'app, selon la règle :
  /// choix explicite de l'utilisateur > langue de l'appareil si on la
  /// supporte > français par défaut.
  Locale resoudreLocale({
    required String? codeChoisi,
    required Locale? localeAppareil,
  }) {
    if (codeChoisi != null) {
      for (final locale in languesSupportees) {
        if (locale.languageCode == codeChoisi) return locale;
      }
    }

    if (localeAppareil != null) {
      for (final locale in languesSupportees) {
        if (locale.languageCode == localeAppareil.languageCode) return locale;
      }
    }

    return langueParDefaut;
  }
}