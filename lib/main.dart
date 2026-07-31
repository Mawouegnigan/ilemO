// lib/main.dart
//
// Point d'entrée de l'application ilemO.
// Initialise Firebase, gère le thème clair/sombre (préférence mémorisée
// localement), et affiche la navigation principale.

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme/app_theme.dart';
import 'services/theme_service.dart';
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
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _chargerPreference();
  }

  Future<void> _chargerPreference() async {
    final modeSombre = await _themeService.getModeSombre();
    setState(() {
      _themeMode = modeSombre ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _basculerTheme(bool modeSombre) async {
    await _themeService.setModeSombre(modeSombre);
    setState(() {
      _themeMode = modeSombre ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ilemO',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: MainNavigation(
        modeSombreActif: _themeMode == ThemeMode.dark,
        onToggleTheme: _basculerTheme,
      ),
    );
  }
}