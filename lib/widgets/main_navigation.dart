// lib/widgets/main_navigation.dart
//
// Conteneur principal de l'application : gère la navigation basse fixe
// à 4 icônes (Accueil, Recherche, Favori, Profil), et transmet les
// informations de thème et de langue au Profil.

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final bool modeSombreActif;
  final ValueChanged<bool> onToggleTheme;
  final String langueActuelle;
  final ValueChanged<String> onChangerLangue;

  const MainNavigation({
    super.key,
    required this.modeSombreActif,
    required this.onToggleTheme,
    required this.langueActuelle,
    required this.onChangerLangue,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  int _searchInitialTab = 0;
  int _searchScreenKey = 0;

  void _goToSearch() {
    setState(() {
      _currentIndex = 1;
      _searchInitialTab = 0;
      _searchScreenKey++;
    });
  }

  void _goToEnFete() {
    setState(() {
      _currentIndex = 1;
      _searchInitialTab = 2;
      _searchScreenKey++;
    });
  }

  void _goToFavoris() => setState(() => _currentIndex = 2);

  List<Widget> get _screens => [
        HomeScreen(onSearchTap: _goToSearch, onEnFeteTap: _goToEnFete),
        SearchScreen(key: ValueKey(_searchScreenKey), initialTabIndex: _searchInitialTab),
        const FavoritesScreen(),
        ProfileScreen(
          onFavorisTap: _goToFavoris,
          modeSombreActif: widget.modeSombreActif,
          onToggleTheme: widget.onToggleTheme,
          langueActuelle: widget.langueActuelle,
          onChangerLangue: widget.onChangerLangue,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    // Lot de test du multilingue (Bloc 1) : ces 4 libellés sont les seuls
    // pour l'instant à passer par AppLocalizations. Le reste de l'app
    // (autres écrans) sera extrait dans un second temps.
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n.navAccueil,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
            label: l10n.navRecherche,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            activeIcon: const Icon(Icons.favorite),
            label: l10n.navFavoris,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: l10n.navProfil,
          ),
        ],
      ),
    );
  }
}