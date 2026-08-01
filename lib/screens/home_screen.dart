// lib/screens/home_screen.dart
//
// Écran Accueil, adapté au mode sombre (28/07/2026) et au multilingue
// (Bloc 2, 31/07/2026) : toutes les chaînes passent par AppLocalizations.

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/paroisse_service.dart';
import '../services/actualite_service.dart';
import '../models/paroisse.dart';
import '../models/actualite.dart';
import 'actualites_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onSearchTap;
  final VoidCallback onEnFeteTap;

  const HomeScreen({super.key, required this.onSearchTap, required this.onEnFeteTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<_OnboardingSlide> _slides(AppLocalizations l10n) => [
        _OnboardingSlide(icon: Icons.list_alt, text: l10n.onboardingSlide1),
        _OnboardingSlide(icon: Icons.near_me_outlined, text: l10n.onboardingSlide2),
        _OnboardingSlide(icon: Icons.favorite_border, text: l10n.onboardingSlide3),
      ];

  @override
  Widget build(BuildContext context) {
    final ParoisseService service = ParoisseService();
    final l10n = AppLocalizations.of(context)!;
    final slides = _slides(l10n);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),

              // En-tête : emblème officiel de l'ECC
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 110,
                      height: 110,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'ilemO',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: context.colorPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.homeChurchTagline,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: context.colorTextSecondary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Text(
                l10n.homeWelcomeTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: context.colorTextPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.homeWelcomeSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5, color: context.colorTextPrimary, height: 1.4),
              ),
              const SizedBox(height: 18),

              // Carte statistique en direct depuis Firestore
              StreamBuilder<List<Paroisse>>(
                stream: service.streamParoisses(),
                builder: (context, snapshot) {
                  final count = snapshot.data?.length;
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: context.colorPrimary.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.church, color: context.colorPrimary, size: 20),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            count == null
                                ? l10n.homeLoadingParoisses
                                : l10n.homeParoissesCount(count),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: context.colorPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton.icon(
                onPressed: widget.onSearchTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.search, size: 20),
                label: Text(l10n.homeSearchButton),
              ),
              const SizedBox(height: 14),

              // Carte "Paroisses en fête ce mois" — apparaît seulement s'il y en a
              StreamBuilder<List<Paroisse>>(
                stream: service.streamParoisses(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox.shrink();
                  final moisActuel = DateTime.now().month;
                  final enFete = snapshot.data!
                      .where((p) => p.estEnFeteCeMois(moisActuel))
                      .toList();
                  if (enFete.isEmpty) return const SizedBox.shrink();

                  return InkWell(
                    onTap: widget.onEnFeteTap,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: context.colorSecondary.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.celebration, color: context.colorSecondary, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              l10n.homeEnFeteBanner(enFete.length),
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w500,
                                color: context.colorSecondary,
                              ),
                            ),
                          ),
                          Icon(Icons.chevron_right, color: context.colorSecondary, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Aperçu des actualités ECC (2 plus récentes)
              StreamBuilder<List<Actualite>>(
                stream: ActualiteService().streamActualites(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  final actualites = snapshot.data!.take(2).toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.sectionActualites,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: context.colorTextPrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const ActualitesScreen()),
                            ),
                            child: Text(
                              l10n.homeVoirTout,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: context.colorPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ...actualites.map((a) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => const ActualitesScreen()),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: context.colorSurface,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: context.colorBorder),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.campaign_outlined, size: 18, color: context.colorSecondary),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        a.titre,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 13, color: context.colorTextPrimary),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                },
              ),
              const SizedBox(height: 8),

              // Carrousel onboarding
              SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slides.length,
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    final slide = slides[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.colorSurface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: context.colorBorder),
                      ),
                      child: Row(
                        children: [
                          Icon(slide.icon, size: 28, color: context.colorSecondary),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              slide.text,
                              style: TextStyle(
                                fontSize: 13.5,
                                color: context.colorTextPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Puces de pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slides.length, (index) {
                  final actif = index == _currentPage;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: actif ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: actif ? context.colorPrimary : context.colorBorder,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingSlide {
  final IconData icon;
  final String text;
  const _OnboardingSlide({required this.icon, required this.text});
}