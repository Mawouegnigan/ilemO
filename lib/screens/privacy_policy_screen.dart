import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Écran affichant la politique de confidentialité d'ilemO.
///
/// Le contenu doit rester strictement synchronisé avec la version HTML
/// hébergée (privacy_policy_hosting/index.html), exigée par les stores
/// (Google Play / App Store) comme URL publique de politique de
/// confidentialité.
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String _lastUpdated = '30 juillet 2026';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text(
          'Politique de confidentialité',
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
            'Dernière mise à jour : $_lastUpdated',
            style: TextStyle(
              color: context.colorTextSecondary,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          _Section(
            title: '1. Qui sommes-nous',
            body:
                "ilemO est une application indépendante créée pour centraliser "
                "les informations des paroisses de l'Église du Christianisme "
                "Céleste (ECC) au Bénin, avec une vocation à s'étendre à "
                "d'autres pays africains. Elle est développée et maintenue "
                "par un développeur indépendant, en dehors de toute structure "
                "administrative officielle de l'ECC.",
          ),
          _Section(
            title: '2. Données que nous collectons',
            body:
                "ilemO est conçue pour fonctionner avec le minimum de données "
                "personnelles possible :\n\n"
                "• Géolocalisation : utilisée uniquement, ponctuellement et "
                "localement sur votre appareil, pour trouver les paroisses "
                "les plus proches de vous (fonctionnalité \"Autour de moi\"). "
                "Cette position n'est jamais envoyée à nos serveurs ni "
                "stockée.\n\n"
                "• Favoris : les paroisses que vous marquez comme favorites "
                "sont enregistrées uniquement sur votre appareil (stockage "
                "local), et ne sont jamais transmises ni partagées.\n\n"
                "• Préférence d'affichage : votre choix de thème clair ou "
                "sombre est également conservé localement sur votre appareil.",
          ),
          _Section(
            title: "3. Ce que nous ne collectons pas (pour l'instant)",
            body:
                "À ce jour, ilemO ne crée pas de compte utilisateur, ne "
                "demande ni nom, ni e-mail, ni numéro de téléphone, et "
                "n'envoie aucune notification push. Aucune donnée "
                "personnelle nominative n'est donc collectée par "
                "l'application dans sa version actuelle.",
          ),
          _Section(
            title: '4. Services tiers utilisés',
            body:
                "Les informations des paroisses (nom, région, contact, "
                "coordonnées GPS, etc.) sont hébergées sur Firebase / Google "
                "Cloud (Google LLC), qui applique ses propres règles de "
                "sécurité et de confidentialité. La fonctionnalité de "
                "localisation et d'ouverture d'itinéraires peut faire appel "
                "à Google Maps. Ces services tiers peuvent, dans le cadre de "
                "leur propre politique, traiter certaines données "
                "techniques (adresse IP, type d'appareil) nécessaires à leur "
                "fonctionnement.",
          ),
          _Section(
            title: '5. Vos droits',
            body:
                "Conformément à la loi béninoise n° 2017-20 du 20 avril "
                "2018 portant Code du numérique en République du Bénin, "
                "relative notamment à la protection des données à caractère "
                "personnel, et sous le contrôle de l'Autorité de Protection "
                "des Données Personnelles (APDP), toute personne dispose "
                "d'un droit d'accès, de rectification et de suppression des "
                "données la concernant. Dans la mesure où ilemO ne collecte "
                "aujourd'hui aucune donnée personnelle nominative sur ses "
                "serveurs, l'exercice de ces droits s'applique "
                "principalement aux données stockées localement sur votre "
                "appareil, que vous pouvez supprimer à tout moment via les "
                "réglages de l'application ou en désinstallant "
                "l'application.",
          ),
          _Section(
            title: '6. Évolution future de cette politique',
            body:
                "Si de nouvelles fonctionnalités venaient à nécessiter la "
                "création d'un compte, l'envoi de notifications, ou toute "
                "autre collecte de données personnelles, cette politique de "
                "confidentialité sera mise à jour au préalable, et la "
                "nouvelle version sera rendue disponible dans l'application "
                "et sur cette page.",
          ),
          _Section(
            title: '7. Enfants',
            body:
                "ilemO n'est pas destinée à un usage ciblé par des enfants "
                "et ne collecte sciemment aucune donnée personnelle "
                "concernant des mineurs.",
          ),
          _Section(
            title: '8. Contact',
            body:
                "Pour toute question concernant cette politique de "
                "confidentialité ou l'application ilemO, vous pouvez nous "
                "contacter via les informations de contact disponibles dans "
                "la section \"À propos\" de l'application.",
          ),
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