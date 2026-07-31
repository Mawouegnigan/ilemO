// lib/screens/actualites_screen.dart
//
// Écran listant toutes les actualités de l'ECC (JIC, séminaires,
// réunions, annonces nationales...).

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/actualite.dart';
import '../services/actualite_service.dart';
import '../theme/app_theme.dart';

class ActualitesScreen extends StatelessWidget {
  const ActualitesScreen({super.key});

  static const List<String> _mois = [
    '', 'jan.', 'fév.', 'mars', 'avr.', 'mai', 'juin',
    'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.',
  ];

  String _formaterDate(DateTime date) => '${date.day} ${_mois[date.month]} ${date.year}';

  @override
  Widget build(BuildContext context) {
    final ActualiteService service = ActualiteService();

    return Scaffold(
      appBar: AppBar(title: const Text('Actualités')),
      body: StreamBuilder<List<Actualite>>(
        stream: service.streamActualites(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final actualites = snapshot.data!;

          if (actualites.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.campaign_outlined, size: 48, color: context.colorTextSecondary),
                    const SizedBox(height: 16),
                    Text(
                      'Aucune actualité pour le moment.',
                      style: TextStyle(color: context.colorTextSecondary),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: actualites.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final a = actualites[index];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: context.colorBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.campaign, size: 18, color: context.colorSecondary),
                        const SizedBox(width: 8),
                        Text(
                          _formaterDate(a.date),
                          style: TextStyle(fontSize: 12, color: context.colorTextSecondary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      a.titre,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: context.colorPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      a.description,
                      style: TextStyle(fontSize: 13.5, color: context.colorTextPrimary, height: 1.4),
                    ),
                    if (a.lienEnSavoirPlus != null && a.lienEnSavoirPlus!.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => launchUrl(
                          Uri.parse(a.lienEnSavoirPlus!),
                          mode: LaunchMode.externalApplication,
                        ),
                        child: Text(
                          'En savoir plus',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: context.colorSecondary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}