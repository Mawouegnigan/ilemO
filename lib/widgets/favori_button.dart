// lib/widgets/favori_button.dart
//
// Bouton cœur réutilisable : bascule l'état favori d'une paroisse
// et se met à jour visuellement. Utilisé dans Recherche, Autour de moi,
// et l'écran Détail.
//
// Correction (Bloc 2, 31/07/2026) : passage de AppColors.xxx (statique)
// à context.colorXxx pour suivre le mode sombre, conformément à la règle
// du projet. Aucun texte visible dans ce widget → pas de clé ARB.

import 'package:flutter/material.dart';
import '../services/favoris_service.dart';
import '../theme/app_theme.dart';

class FavoriButton extends StatefulWidget {
  final String paroisseId;
  final double size;

  const FavoriButton({super.key, required this.paroisseId, this.size = 24});

  @override
  State<FavoriButton> createState() => _FavoriButtonState();
}

class _FavoriButtonState extends State<FavoriButton> {
  final FavorisService _service = FavorisService();
  bool _estFavori = false;
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    final estFavori = await _service.estFavori(widget.paroisseId);
    if (mounted) setState(() { _estFavori = estFavori; _chargement = false; });
  }

  Future<void> _basculer() async {
    final nouvelEtat = await _service.basculerFavori(widget.paroisseId);
    if (mounted) setState(() => _estFavori = nouvelEtat);
  }

  @override
  Widget build(BuildContext context) {
    if (_chargement) {
      return SizedBox(width: widget.size, height: widget.size);
    }
    return IconButton(
      icon: Icon(
        _estFavori ? Icons.favorite : Icons.favorite_border,
        color: _estFavori ? context.colorError : context.colorTextSecondary,
        size: widget.size,
      ),
      onPressed: _basculer,
      splashRadius: widget.size,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }
}