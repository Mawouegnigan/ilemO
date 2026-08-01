// lib/screens/profile_screen.dart
//
// Écran Profil — version standard (Lot 4), adapté au mode sombre (28/07/2026).
// + tuiles "Aide" et "Politique de confidentialité" (30/07/2026).
// + sélecteur de langue (30/07/2026) — infrastructure multilingue, Bloc 1.
// + extraction multilingue complète (Bloc 2, 31/07/2026). Les noms de
// langues (_nomsLangues) restent volontairement non traduits : convention
// standard des sélecteurs de langue (chaque langue s'affiche dans son
// propre nom natif).

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../l10n/app_localizations.dart';
import '../services/favoris_service.dart';
import '../theme/app_theme.dart';
import 'aide_screen.dart';
import 'privacy_policy_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onFavorisTap;
  final bool modeSombreActif;
  final ValueChanged<bool> onToggleTheme;
  final String langueActuelle; // code : 'fr', 'en', 'yo', 'guw'
  final ValueChanged<String> onChangerLangue;

  const ProfileScreen({
    super.key,
    required this.onFavorisTap,
    required this.modeSombreActif,
    required this.onToggleTheme,
    required this.langueActuelle,
    required this.onChangerLangue,
  });

  static const Map<String, String> _nomsLangues = {
    'fr': 'Français',
    'en': 'English',
    'yo': 'Yorùbá (bêta)',
    'guw': 'Gungbe (bêta)',
  };

  void _partagerApp(AppLocalizations l10n) {
    // TODO : remplacer par le vrai lien Play Store / App Store une fois
    // l'application publiée (Lot 6).
    SharePlus.instance.share(
      ShareParams(text: l10n.profileShareText),
    );
  }

  Future<void> _choisirLangue(BuildContext context, AppLocalizations l10n) async {
    final choix = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: context.colorSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text(
                l10n.profileChooseLangueTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: context.colorTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              for (final entry in _nomsLangues.entries)
                RadioListTile<String>(
                  value: entry.key,
                  groupValue: langueActuelle,
                  activeColor: context.colorPrimary,
                  title: Text(
                    entry.value,
                    style: TextStyle(color: context.colorTextPrimary),
                  ),
                  onChanged: (value) => Navigator.of(context).pop(value),
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (choix != null && choix != langueActuelle) {
      onChangerLangue(choix);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FavorisService favorisService = FavorisService();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorPrimary.withValues(alpha: 0.10),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        size: 44,
                        color: context.colorPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.profileUserName,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: context.colorTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.profileConnexionNotice,
                      style: TextStyle(fontSize: 12, color: context.colorTextSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              FutureBuilder<List<String>>(
                future: favorisService.getFavorisIds(),
                builder: (context, snapshot) {
                  final count = snapshot.data?.length ?? 0;
                  return _ProfileTile(
                    icon: Icons.favorite_border,
                    title: l10n.profileMesFavoris,
                    subtitle: count == 0
                        ? l10n.profileFavorisNone
                        : l10n.profileFavorisCount(count),
                    onTap: onFavorisTap,
                  );
                },
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.language,
                title: l10n.profileLangue,
                subtitle: _nomsLangues[langueActuelle] ?? _nomsLangues['fr']!,
                onTap: () => _choisirLangue(context, l10n),
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.info_outline,
                title: l10n.profileAPropos,
                subtitle: l10n.profileVersionSubtitle,
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const _AboutDialog(),
                ),
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.share_outlined,
                title: l10n.profilePartagerApp,
                subtitle: l10n.profilePartagerAppSubtitle,
                onTap: () => _partagerApp(l10n),
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.help_outline,
                title: l10n.profileAide,
                subtitle: l10n.profileAideSubtitle,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AideScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.privacy_tip_outlined,
                title: l10n.profilePrivacy,
                subtitle: l10n.profilePrivacySubtitle,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),

              Material(
                color: context.colorSurface,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.colorBorder),
                  ),
                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    secondary: Icon(Icons.dark_mode_outlined, color: context.colorPrimary),
                    title: Text(
                      l10n.profileModeSombre,
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                        color: context.colorTextPrimary,
                      ),
                    ),
                    value: modeSombreActif,
                    onChanged: onToggleTheme,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.person_add_alt_outlined,
                title: l10n.profileCreerCompte,
                subtitle: l10n.profileBientotDisponible,
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final desactive = onTap == null;
    return Material(
      color: context.colorSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.colorBorder),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: desactive
                    ? context.colorTextSecondary.withValues(alpha: 0.5)
                    : context.colorPrimary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                        color: desactive ? context.colorTextSecondary : context.colorTextPrimary,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12.5, color: context.colorTextSecondary),
                    ),
                  ],
                ),
              ),
              if (!desactive)
                Icon(Icons.chevron_right, color: context.colorTextSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutDialog extends StatelessWidget {
  const _AboutDialog();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: const Text('ilemO'),
      content: Text(
        '${l10n.aboutDialogDescription}\n\n'
        '${l10n.profileVersionSubtitle}\n\n'
        '${l10n.aboutDialogCredits}\n'
        'Mawouégnigan Grégoire FANGNON\n'
        '${l10n.aboutDialogRole}',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.aboutDialogClose),
        ),
      ],
    );
  }
}