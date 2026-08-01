// lib/screens/search_screen.dart
//
// Écran Recherche complet, adapté au mode sombre (28/07/2026) et au
// multilingue (Bloc 2, 31/07/2026). Le filtre "Tous les pays" utilise
// désormais un sentinel (_selectedPays == null) plutôt qu'une chaîne
// traduite, pour ne pas casser la logique de comparaison au changement
// de langue.

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../l10n/app_localizations.dart';
import '../models/paroisse.dart';
import '../services/paroisse_service.dart';
import '../theme/app_theme.dart';
import '../widgets/favori_button.dart';
import 'paroisse_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  final int initialTabIndex;

  const SearchScreen({super.key, this.initialTabIndex = 0});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final ParoisseService _service = ParoisseService();

  String _query = '';
  // null = "tous les pays" (sentinel indépendant de la langue d'affichage)
  String? _selectedPays;
  final List<String> _paysDisponibles = const ['Bénin'];

  Position? _position;
  bool _loadingPosition = false;
  String? _positionError;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Paroisse> _filtrer(List<Paroisse> paroisses) {
    return paroisses.where((p) {
      final matchPays = _selectedPays == null || p.pays == _selectedPays;
      final q = _query.trim().toLowerCase();
      final matchRecherche = q.isEmpty ||
          p.nom.toLowerCase().contains(q) ||
          p.ville.toLowerCase().contains(q) ||
          p.region.toLowerCase().contains(q);
      return matchPays && matchRecherche;
    }).toList();
  }

  Future<void> _activerLocalisation() async {
    setState(() {
      _loadingPosition = true;
      _positionError = null;
    });
    try {
      final position = await _service.getPositionActuelle();
      setState(() {
        _position = position;
        _loadingPosition = false;
      });
    } catch (e) {
      setState(() {
        _positionError = e.toString().replaceFirst('Exception: ', '');
        _loadingPosition = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.searchTitle),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: context.colorPrimary,
          labelColor: context.isDarkMode ? Colors.white : Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(text: l10n.searchTabListe),
            Tab(text: l10n.searchTabAutourDeMoi),
            Tab(text: l10n.searchTabEnFete),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListeTab(l10n),
          _buildAutourDeMoiTab(l10n),
          _buildEnFeteTab(l10n),
        ],
      ),
    );
  }

  Widget _buildListeTab(AppLocalizations l10n) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            children: [
              DropdownButtonFormField<String?>(
                initialValue: _selectedPays,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.public, color: context.colorTextSecondary),
                  filled: true,
                  fillColor: context.colorSurface,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: context.colorTextSecondary),
                  ),
                ),
                items: [
                  DropdownMenuItem<String?>(
                    value: null,
                    child: Text(l10n.searchAllCountries),
                  ),
                  ..._paysDisponibles.map(
                    (pays) => DropdownMenuItem<String?>(value: pays, child: Text(pays)),
                  ),
                ],
                onChanged: (value) => setState(() => _selectedPays = value),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: l10n.searchHintQuery,
                  prefixIcon: Icon(Icons.search, color: context.colorTextSecondary),
                  filled: true,
                  fillColor: context.colorSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: context.colorTextSecondary),
                  ),
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
            ],
          ),
        ),
        Expanded(
          child: StreamBuilder<List<Paroisse>>(
            stream: _service.streamParoisses(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(l10n.errorWithMessage('${snapshot.error}')));
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final paroisses = _filtrer(snapshot.data!);

              if (paroisses.isEmpty) {
                return Center(child: Text(l10n.searchNoResults));
              }

              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 8),
                itemCount: paroisses.length,
                separatorBuilder: (_, __) => Divider(height: 1, color: context.colorBorder),
                itemBuilder: (context, index) {
                  final p = paroisses[index];
                  return ListTile(
                    title: Text(p.nom),
                    subtitle: Text('${p.ville}, ${p.region}'),
                    trailing: FavoriButton(paroisseId: p.id, size: 22),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ParoisseDetailScreen(paroisse: p),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAutourDeMoiTab(AppLocalizations l10n) {
    if (_position == null && !_loadingPosition) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.near_me_outlined, size: 48, color: context.colorSecondary),
              const SizedBox(height: 16),
              Text(
                l10n.searchEnableLocationPrompt,
                textAlign: TextAlign.center,
                style: TextStyle(color: context.colorTextPrimary),
              ),
              if (_positionError != null) ...[
                const SizedBox(height: 12),
                Text(
                  _positionError!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: context.colorError, fontSize: 13),
                ),
              ],
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _activerLocalisation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorSecondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.my_location),
                label: Text(l10n.searchEnableLocationButton),
              ),
            ],
          ),
        ),
      );
    }

    if (_loadingPosition) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<List<Paroisse>>(
      stream: _service.streamParoisses(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(l10n.errorWithMessage('${snapshot.error}')));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final triees = _service.trierParDistance(snapshot.data!, _position!);

        if (triees.isEmpty) {
          return Center(child: Text(l10n.searchNoGpsParoisses));
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: triees.length,
          separatorBuilder: (_, __) => Divider(height: 1, color: context.colorBorder),
          itemBuilder: (context, index) {
            final entry = triees[index];
            final paroisse = entry.key;
            final distanceKm = entry.value / 1000;

            return ListTile(
              title: Text(paroisse.nom),
              subtitle: Text('${paroisse.ville}, ${paroisse.region}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${distanceKm.toStringAsFixed(1)} km',
                    style: TextStyle(
                      color: context.colorSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  FavoriButton(paroisseId: paroisse.id, size: 20),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ParoisseDetailScreen(paroisse: paroisse),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildEnFeteTab(AppLocalizations l10n) {
    final moisActuel = DateTime.now().month;

    return StreamBuilder<List<Paroisse>>(
      stream: _service.streamParoisses(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(l10n.errorWithMessage('${snapshot.error}')));
        }
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final enFete = snapshot.data!
            .where((p) => p.estEnFeteCeMois(moisActuel))
            .toList()
          ..sort((a, b) => (a.jourFete ?? 0).compareTo(b.jourFete ?? 0));

        if (enFete.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.celebration_outlined, size: 48, color: context.colorTextSecondary),
                  const SizedBox(height: 16),
                  Text(
                    l10n.searchNoEnFete,
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
          itemCount: enFete.length,
          separatorBuilder: (_, __) => Divider(height: 1, color: context.colorBorder),
          itemBuilder: (context, index) {
            final p = enFete[index];
            return ListTile(
              leading: Icon(Icons.celebration, color: context.colorSecondary),
              title: Text(p.nom),
              subtitle: Text('${p.ville}, ${p.region} — ${l10n.searchFeteLe(p.dateFeteFormatee)}'),
              trailing: FavoriButton(paroisseId: p.id, size: 20),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ParoisseDetailScreen(paroisse: p),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}