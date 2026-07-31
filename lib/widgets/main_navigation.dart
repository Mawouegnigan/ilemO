// lib/widgets/main_navigation.dart
//
// Conteneur principal de l'application : gère la navigation basse fixe
// à 4 icônes (Accueil, Recherche, Favori, Profil), et transmet les
// informations de thème au Profil.

import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final bool modeSombreActif;
  final ValueChanged<bool> onToggleTheme;

  const MainNavigation({
    super.key,
    required this.modeSombreActif,
    required this.onToggleTheme,
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
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}