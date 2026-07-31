// lib/main.dart
//
// Point d'entrée de l'application ilemO.
// Initialise Firebase, gère le thème clair/sombre et la langue
// (préférences mémorisées localement), et affiche la navigation
// principale.
//
// Note sur la langue (30/07/2026, corrigé) : Flutter ne fournit pas de
// traductions système pour le yoruba ('yo') ni le gungbe ('guw'). On
// utilise des délégués de repli (fallback_localizations.dart) qui
// déclarent supporter ces langues mais renvoient les textes système en
// anglais — seuls nos propres textes (AppLocalizations) sont vraiment
// traduits en yo/guw. C'est le principe recommandé par la documentation
// officielle Flutter pour ajouter une langue non supportée nativement.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme/app_theme.dart';
import 'services/theme_service.dart';
import 'services/locale_service.dart';
import 'l10n/app_localizations.dart';
import 'l10n/fallback_localizations.dart';
import 'widgets/main_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const IlemoApp());
}

class IlemoApp extends StatefulWidget {
  const IlemoApp({super.key});

  @override
  State<IlemoApp> createState() => _IlemoAppState();
}

class _IlemoAppState extends State<IlemoApp> {
  final ThemeService _themeService = ThemeService();
  final LocaleService _localeService = LocaleService();

  ThemeMode _themeMode = ThemeMode.light;
  String? _codeLangueChoisie; // null = pas encore choisi -> auto-détection

  @override
  void initState() {
    super.initState();
    _chargerPreferences();
  }

  Future<void> _chargerPreferences() async {
    final modeSombre = await _themeService.getModeSombre();
    final langueChoisie = await _localeService.getLangueChoisie();
    if (!mounted) return;
    setState(() {
      _themeMode = modeSombre ? ThemeMode.dark : ThemeMode.light;
      _codeLangueChoisie = langueChoisie;
    });
  }

  Future<void> _basculerTheme(bool modeSombre) async {
    await _themeService.setModeSombre(modeSombre);
    setState(() {
      _themeMode = modeSombre ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _changerLangue(String codeLangue) async {
    await _localeService.setLangueChoisie(codeLangue);
    setState(() {
      _codeLangueChoisie = codeLangue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Langue de l'appareil, pour l'auto-détection si l'utilisateur n'a
    // encore rien choisi explicitement.
    final localeAppareil = WidgetsBinding.instance.platformDispatcher.locale;

    final Locale langueActuelle = _localeService.resoudreLocale(
      codeChoisi: _codeLangueChoisie,
      localeAppareil: localeAppareil,
    );

    return MaterialApp(
      title: 'ilemO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,

      // La locale de l'app est directement la langue choisie, y compris
      // yo/guw : les délégués de repli ci-dessous prennent le relais pour
      // les textes système sur ces deux langues.
      locale: langueActuelle,
      supportedLocales: LocaleService.languesSupportees,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationsDelegate(),
        FallbackWidgetsLocalizationsDelegate(),
        FallbackCupertinoLocalizationsDelegate(),
      ],

      home: MainNavigation(
        modeSombreActif: _themeMode == ThemeMode.dark,
        onToggleTheme: _basculerTheme,
        langueActuelle: langueActuelle.languageCode,
        onChangerLangue: _changerLangue,
      ),
    );
  }
}