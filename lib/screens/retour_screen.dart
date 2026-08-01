// lib/screens/retour_screen.dart
//
// Écran "Donner mon avis" : formulaire de retour privé sur l'application
// (note optionnelle 1-5, message requis, nom/contact optionnels).

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/retour.dart';
import '../services/retour_service.dart';
import '../theme/app_theme.dart';

class RetourScreen extends StatefulWidget {
  const RetourScreen({super.key});

  @override
  State<RetourScreen> createState() => _RetourScreenState();
}

class _RetourScreenState extends State<RetourScreen> {
  final RetourService _service = RetourService();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  int? _note;
  bool _envoiEnCours = false;
  String? _erreurMessage;
  bool _envoye = false;

  @override
  void dispose() {
    _messageController.dispose();
    _nomController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  Future<void> _envoyer(AppLocalizations l10n) async {
    if (_messageController.text.trim().isEmpty) {
      setState(() => _erreurMessage = l10n.retourMessageRequired);
      return;
    }

    setState(() {
      _envoiEnCours = true;
      _erreurMessage = null;
    });

    try {
      await _service.envoyerRetour(
        Retour(
          message: _messageController.text.trim(),
          note: _note,
          nom: _nomController.text,
          contact: _contactController.text,
        ),
      );
      if (!mounted) return;
      setState(() {
        _envoiEnCours = false;
        _envoye = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _envoiEnCours = false;
        _erreurMessage = l10n.retourErrorSending;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_envoye) {
      return Scaffold(
        backgroundColor: context.colorBackground,
        appBar: AppBar(
          backgroundColor: context.colorSurface,
          elevation: 0,
          title: Text(
            l10n.retourTitle,
            style: TextStyle(color: context.colorTextPrimary, fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: context.colorTextPrimary),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite, size: 56, color: context.colorPrimary),
                const SizedBox(height: 20),
                Text(
                  l10n.retourSuccessTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: context.colorTextPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.retourSuccessMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: context.colorTextSecondary, height: 1.4),
                ),
                const SizedBox(height: 28),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(l10n.retourSuccessClose),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text(
          l10n.retourTitle,
          style: TextStyle(color: context.colorTextPrimary, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: context.colorTextPrimary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.retourIntro,
                style: TextStyle(fontSize: 13.5, color: context.colorTextSecondary, height: 1.4),
              ),
              const SizedBox(height: 24),

              Text(
                l10n.retourNoteLabel,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: context.colorTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  final valeur = index + 1;
                  final active = _note != null && valeur <= _note!;
                  return IconButton(
                    onPressed: () => setState(() => _note = valeur == _note ? null : valeur),
                    icon: Icon(
                      active ? Icons.star : Icons.star_border,
                      color: context.colorSecondary,
                      size: 30,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                    splashRadius: 20,
                  );
                }),
              ),
              const SizedBox(height: 16),

              Text(
                l10n.retourMessageLabel,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: context.colorTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _messageController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: l10n.retourMessageHint,
                  filled: true,
                  fillColor: context.colorSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: context.colorBorder),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: l10n.retourNomLabel,
                  filled: true,
                  fillColor: context.colorSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: context.colorBorder),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _contactController,
                decoration: InputDecoration(
                  labelText: l10n.retourContactLabel,
                  hintText: l10n.retourContactHint,
                  filled: true,
                  fillColor: context.colorSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: context.colorBorder),
                  ),
                ),
              ),

              if (_erreurMessage != null) ...[
                const SizedBox(height: 14),
                Text(
                  _erreurMessage!,
                  style: TextStyle(color: context.colorError, fontSize: 13),
                ),
              ],

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _envoiEnCours ? null : () => _envoyer(l10n),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colorPrimary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: _envoiEnCours
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Text(l10n.retourSendingButton),
                          ],
                        )
                      : Text(
                          l10n.retourSubmitButton,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}