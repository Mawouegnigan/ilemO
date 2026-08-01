// lib/screens/paroisse_detail_screen.dart
//
// Écran Détail paroisse, adapté au mode sombre (28/07/2026),
// au partage (30/07/2026) et au multilingue (Bloc 2, 31/07/2026).

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../models/paroisse.dart';
import '../theme/app_theme.dart';
import '../widgets/favori_button.dart';

class ParoisseDetailScreen extends StatelessWidget {
  final Paroisse paroisse;

  const ParoisseDetailScreen({super.key, required this.paroisse});

  Future<void> _ouvrirGoogleMaps(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final uri = Uri.parse(paroisse.localisationGoogleMaps);
    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.detailCannotOpenMaps)),
      );
    }
  }

  void _partagerParoisse(AppLocalizations l10n) {
    final lignes = <String>[
      paroisse.nom,
      '${paroisse.ville}, ${paroisse.pays}',
      '',
      '${l10n.labelChargeParoissial} : ${paroisse.chargeParoissial}',
      '${l10n.labelContact} : ${paroisse.contact}',
    ];

    if (paroisse.siteWeb != null && paroisse.siteWeb!.isNotEmpty) {
      lignes.add('${l10n.labelSiteWeb} : ${paroisse.siteWeb}');
    }

    if (paroisse.aDateDeFete) {
      lignes.add('${l10n.labelFeteParoisse} : ${paroisse.dateFeteFormatee}');
    }

    if (paroisse.localisationGoogleMaps.isNotEmpty) {
      lignes.add('');
      lignes.add('${l10n.detailShareItineraireLabel} : ${paroisse.localisationGoogleMaps}');
    }

    lignes.add('');
    lignes.add(l10n.detailShareFooter);

    SharePlus.instance.share(
      ShareParams(text: lignes.join('\n')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(paroisse.nom),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            tooltip: l10n.detailShareTooltip,
            onPressed: () => _partagerParoisse(l10n),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FavoriButton(paroisseId: paroisse.id, size: 26),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paroisse.nom,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: context.colorPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${paroisse.ville}, ${paroisse.pays}',
                style: TextStyle(fontSize: 14, color: context.colorTextSecondary),
              ),
              const SizedBox(height: 24),

              _InfoRow(icon: Icons.map_outlined, label: l10n.labelRegion, value: paroisse.region),
              _InfoRow(icon: Icons.map_outlined, label: l10n.labelSousRegion, value: paroisse.sousRegion),
              _InfoRow(icon: Icons.location_city, label: l10n.labelVille, value: paroisse.ville),
              _InfoRow(icon: Icons.person_outline, label: l10n.labelChargeParoissial, value: paroisse.chargeParoissial),
              _InfoRow(icon: Icons.phone_outlined, label: l10n.labelContact, value: paroisse.contact),
              if (paroisse.siteWeb != null && paroisse.siteWeb!.isNotEmpty)
                _InfoRow(icon: Icons.language, label: l10n.labelSiteWeb, value: paroisse.siteWeb!),
              if (paroisse.aDateDeFete)
                _InfoRow(icon: Icons.celebration_outlined, label: l10n.labelFeteParoisse, value: paroisse.dateFeteFormatee),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _ouvrirGoogleMaps(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorSecondary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.directions),
                  label: Text(
                    l10n.detailGoButton,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: context.colorTextSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: context.colorTextSecondary),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 15, color: context.colorTextPrimary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}