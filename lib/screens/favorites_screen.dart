// lib/screens/favorites_screen.dart
//
// Écran Favoris, adapté au mode sombre (28/07/2026) et au multilingue
// (Bloc 2, 31/07/2026).

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/paroisse.dart';
import '../services/favoris_service.dart';
import '../services/paroisse_service.dart';
import '../theme/app_theme.dart';
import '../widgets/favori_button.dart';
import 'paroisse_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavorisService _favorisService = FavorisService();
  final ParoisseService _paroisseService = ParoisseService();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.favoritesTitle)),
      body: StreamBuilder<List<Paroisse>>(
        stream: _paroisseService.streamParoisses(),
        builder: (context, snapshotParoisses) {
          if (snapshotParoisses.hasError) {
            return Center(child: Text(l10n.errorWithMessage('${snapshotParoisses.error}')));
          }
          if (!snapshotParoisses.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return FutureBuilder<List<String>>(
            future: _favorisService.getFavorisIds(),
            builder: (context, snapshotFavoris) {
              if (!snapshotFavoris.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final idsFavoris = snapshotFavoris.data!;
              final paroissesFavorites = snapshotParoisses.data!
                  .where((p) => idsFavoris.contains(p.id))
                  .toList();

              if (paroissesFavorites.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border, size: 48, color: context.colorTextSecondary),
                        const SizedBox(height: 16),
                        Text(
                          l10n.favoritesEmptyMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: context.colorTextSecondary),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: paroissesFavorites.length,
                separatorBuilder: (_, __) => Divider(height: 1, color: context.colorBorder),
                itemBuilder: (context, index) {
                  final p = paroissesFavorites[index];
                  return ListTile(
                    title: Text(p.nom),
                    subtitle: Text('${p.ville}, ${p.region}'),
                    trailing: FavoriButton(paroisseId: p.id, size: 22),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ParoisseDetailScreen(paroisse: p),
                        ),
                      ).then((_) => setState(() {}));
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}