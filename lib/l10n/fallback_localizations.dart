// lib/l10n/fallback_localizations.dart
//
// Flutter ne fournit pas de traductions système (boutons, dates, etc.)
// pour le yoruba ('yo') ni le gungbe ('guw'). Ces 3 délégués déclarent
// supporter ces langues, mais renvoient simplement les textes système
// anglais déjà prêts — seuls NOS textes à nous (via AppLocalizations)
// sont réellement traduits en yo/guw. C'est le même principe que
// l'exemple officiel Flutter pour ajouter une langue non supportée
// (voir docs.flutter.dev/ui/internationalization, exemple "Nynorsk").

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const List<String> languesSansSupportSysteme = ['yo', 'guw'];

class FallbackMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      languesSansSupportSysteme.contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return GlobalMaterialLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(FallbackMaterialLocalizationsDelegate old) => false;
}

class FallbackWidgetsLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const FallbackWidgetsLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      languesSansSupportSysteme.contains(locale.languageCode);

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    return GlobalWidgetsLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(FallbackWidgetsLocalizationsDelegate old) => false;
}

class FallbackCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      languesSansSupportSysteme.contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return GlobalCupertinoLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}