// lib/theme/app_theme.dart
//
// Centralise la charte graphique : palette claire (validée le 27/07/2026)
// et palette sombre (validée le 28/07/2026).

import 'package:flutter/material.dart';

class AppColors {
  // Palette claire
  static const Color primary = Color(0xFF1B4B7A);
  static const Color secondary = Color(0xFF2E7D5B);
  static const Color background = Color(0xFFFAFAF8);
  static const Color textPrimary = Color(0xFF1A2C3D);
  static const Color textSecondary = Color(0xFF6B8494);
  static const Color error = Color(0xFFC0392B);

  // Palette sombre
  static const Color primaryDark = Color(0xFF3D7CB8);
  static const Color secondaryDark = Color(0xFF3E9973);
  static const Color backgroundDark = Color(0xFF14181C);
  static const Color surfaceDark = Color(0xFF1E242B);
  static const Color textPrimaryDarkMode = Color(0xFFE8EAED);
  static const Color textSecondaryDarkMode = Color(0xFF8B97A3);
  static const Color errorDark = Color(0xFFE0685A);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
        error: AppColors.error,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.textPrimary),
        bodyLarge: TextStyle(color: AppColors.textPrimary),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      cardColor: AppColors.surfaceDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryDark,
        brightness: Brightness.dark,
        primary: AppColors.primaryDark,
        secondary: AppColors.secondaryDark,
        surface: AppColors.surfaceDark,
        error: AppColors.errorDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundDark,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundDark,
        selectedItemColor: AppColors.primaryDark,
        unselectedItemColor: AppColors.textSecondaryDarkMode,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.textPrimaryDarkMode),
        bodyLarge: TextStyle(color: AppColors.textPrimaryDarkMode),
      ),
    );
  }

  // Conservé pour compatibilité : équivaut à lightTheme.
  static ThemeData get theme => lightTheme;
}

/// Extension pratique : donne la bonne couleur (claire ou sombre) selon
/// le thème actuellement actif, pour éviter de dupliquer cette logique
/// dans chaque écran.
extension AppColorsX on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get colorPrimary => isDarkMode ? AppColors.primaryDark : AppColors.primary;
  Color get colorSecondary => isDarkMode ? AppColors.secondaryDark : AppColors.secondary;
  Color get colorBackground => isDarkMode ? AppColors.backgroundDark : AppColors.background;
  Color get colorSurface => isDarkMode ? AppColors.surfaceDark : Colors.white;
  Color get colorTextPrimary => isDarkMode ? AppColors.textPrimaryDarkMode : AppColors.textPrimary;
  Color get colorTextSecondary => isDarkMode ? AppColors.textSecondaryDarkMode : AppColors.textSecondary;
  Color get colorError => isDarkMode ? AppColors.errorDark : AppColors.error;
  Color get colorBorder => isDarkMode ? const Color(0xFF2A3138) : const Color(0xFFD3D1C7);
}