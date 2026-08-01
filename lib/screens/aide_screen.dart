// lib/screens/aide_screen.dart
//
// Écran d'aide : explique chaque fonctionnalité de l'application via
// une liste de sections dépliables (ExpansionTile).
// Multilingue (Bloc 2, 31/07/2026) : _items devient une méthode dépendant
// de l10n, car son contenu ne peut plus être une constante statique.

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class AideScreen extends StatelessWidget {
  const AideScreen({super.key});

  List<_AideItem> _items(AppLocalizations l10n) => [
        _AideItem(
          icon: Icons.home_outlined,
          title: l10n.aideAccueilTitle,
          description: l10n.aideAccueilDesc,
        ),
        _AideItem(
          icon: Icons.list_alt_outlined,
          title: l10n.aideListeTitle,
          description: l10n.aideListeDesc,
        ),
        _AideItem(
          icon: Icons.near_me_outlined,
          title: l10n.aideAutourDeMoiTitle,
          description: l10n.aideAutourDeMoiDesc,
        ),
        _AideItem(
          icon: Icons.celebration_outlined,
          title: l10n.aideEnFeteTitle,
          description: l10n.aideEnFeteDesc,
        ),
        _AideItem(
          icon: Icons.church_outlined,
          title: l10n.aideDetailTitle,
          description: l10n.aideDetailDesc,
        ),
        _AideItem(
          icon: Icons.favorite_border,
          title: l10n.aideFavorisTitle,
          description: l10n.aideFavorisDesc,
        ),
        _AideItem(
          icon: Icons.newspaper_outlined,
          title: l10n.aideActualitesTitle,
          description: l10n.aideActualitesDesc,
        ),
        _AideItem(
          icon: Icons.dark_mode_outlined,
          title: l10n.aideModeSombreTitle,
          description: l10n.aideModeSombreDesc,
        ),
        _AideItem(
          icon: Icons.person_outline,
          title: l10n.aideProfilTitle,
          description: l10n.aideProfilDesc,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = _items(l10n);

    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text(
          l10n.aideTitle,
          style: TextStyle(
            color: context.colorTextPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: context.colorTextPrimary),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: context.colorBorder,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: Icon(item.icon, color: context.colorPrimary),
              title: Text(
                item.title,
                style: TextStyle(
                  color: context.colorTextPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              iconColor: context.colorPrimary,
              collapsedIconColor: context.colorTextSecondary,
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: TextStyle(
                    color: context.colorTextSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AideItem {
  final IconData icon;
  final String title;
  final String description;

  const _AideItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}