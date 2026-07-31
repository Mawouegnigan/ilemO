// lib/screens/profile_screen.dart
//
// Écran Profil — version standard (Lot 4), adapté au mode sombre (28/07/2026).
// + tuiles "Aide" et "Politique de confidentialité" (30/07/2026).

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../services/favoris_service.dart';
import '../theme/app_theme.dart';
import 'aide_screen.dart';
import 'privacy_policy_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onFavorisTap;
  final bool modeSombreActif;
  final ValueChanged<bool> onToggleTheme;

  const ProfileScreen({
    super.key,
    required this.onFavorisTap,
    required this.modeSombreActif,
    required this.onToggleTheme,
  });

  void _partagerApp() {
    // TODO : remplacer par le vrai lien Play Store / App Store une fois
    // l'application publiée (Lot 6).
    SharePlus.instance.share(
      ShareParams(
        text: 'Découvrez ilemO, l\'application qui centralise les paroisses '
            'de l\'Église du Christianisme Céleste au Bénin !',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FavorisService favorisService = FavorisService();

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
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
                      'Utilisateur ilemO',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: context.colorTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Connexion non requise pour le moment',
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
                    title: 'Mes favoris',
                    subtitle: count == 0
                        ? 'Aucune paroisse enregistrée'
                        : '$count paroisse${count > 1 ? 's' : ''} enregistrée${count > 1 ? 's' : ''}',
                    onTap: onFavorisTap,
                  );
                },
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.info_outline,
                title: 'À propos d\'ilemO',
                subtitle: 'Version 1.0.0 — Bénin',
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => const _AboutDialog(),
                ),
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.share_outlined,
                title: 'Partager l\'app',
                subtitle: 'Faites connaître ilemO autour de vous',
                onTap: _partagerApp,
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.help_outline,
                title: 'Aide',
                subtitle: 'Comment utiliser l\'application',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AideScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),

              _ProfileTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Politique de confidentialité',
                subtitle: 'Comment vos données sont traitées',
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
                      'Mode sombre',
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
                title: 'Créer un compte',
                subtitle: 'Bientôt disponible',
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
    return AlertDialog(
      title: const Text('ilemO'),
      content: const Text(
        'Application de centralisation des paroisses de l\'Église du '
        'Christianisme Céleste.\n\nVersion 1.0.0 — Bénin\n\n'
        'Conception et développement :\nMawouégnigan Grégoire FANGNON\n'
        'Développeur Fullstack Web & Mobile',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}