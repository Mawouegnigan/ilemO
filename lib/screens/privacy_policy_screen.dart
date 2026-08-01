// lib/screens/privacy_policy_screen.dart
//
// Écran affichant la politique de confidentialité d'ilemO.
//
// Le contenu doit rester strictement synchronisé avec la version HTML
// hébergée (privacy_policy_hosting/index.html), exigée par les stores
// (Google Play / App Store) comme URL publique de politique de
// confidentialité — cette page HTML reste en français uniquement.
//
// Multilingue (Bloc 2, 31/07/2026) : traduction complète en fr/en.
// Pour yo/guw, seuls les titres de section sont traduits ; le corps du
// texte reste en français, ce contenu étant juridique et nécessitant une
// relecture bilingue spécialisée avant toute traduction publiée.

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String _lastUpdated = '30 juillet 2026';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text(
          l10n.privacyTitle,
          style: TextStyle(
            color: context.colorTextPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: context.colorTextPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            l10n.privacyLastUpdated(_lastUpdated),
            style: TextStyle(
              color: context.colorTextSecondary,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          _Section(title: l10n.privacySection1Title, body: l10n.privacySection1Body),
          _Section(title: l10n.privacySection2Title, body: l10n.privacySection2Body),
          _Section(title: l10n.privacySection3Title, body: l10n.privacySection3Body),
          _Section(title: l10n.privacySection4Title, body: l10n.privacySection4Body),
          _Section(title: l10n.privacySection5Title, body: l10n.privacySection5Body),
          _Section(title: l10n.privacySection6Title, body: l10n.privacySection6Body),
          _Section(title: l10n.privacySection7Title, body: l10n.privacySection7Body),
          _Section(title: l10n.privacySection8Title, body: l10n.privacySection8Body),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String body;

  const _Section({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: context.colorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: TextStyle(
              color: context.colorTextPrimary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}