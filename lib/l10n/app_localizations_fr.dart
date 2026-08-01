// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get navAccueil => 'Accueil';

  @override
  String get navRecherche => 'Recherche';

  @override
  String get navFavoris => 'Favori';

  @override
  String get navProfil => 'Profil';

  @override
  String get homeChurchTagline =>
      'Paroisses de l\'Église du Christianisme Céleste';

  @override
  String get homeWelcomeTitle => 'Bienvenue';

  @override
  String get homeWelcomeSubtitle =>
      'Retrouvez rapidement les informations et la localisation de n\'importe quelle paroisse.';

  @override
  String get homeLoadingParoisses => 'Chargement des paroisses…';

  @override
  String homeParoissesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# paroisses référencées',
      one: '# paroisse référencée',
    );
    return '$_temp0';
  }

  @override
  String get homeSearchButton => 'Rechercher une paroisse';

  @override
  String homeEnFeteBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# paroisses en fête ce mois-ci — à visiter !',
      one: '# paroisse en fête ce mois-ci — à visiter !',
    );
    return '$_temp0';
  }

  @override
  String get sectionActualites => 'Actualités';

  @override
  String get homeVoirTout => 'Voir tout';

  @override
  String get onboardingSlide1 =>
      'Parcourez l\'annuaire de toutes les paroisses';

  @override
  String get onboardingSlide2 =>
      'Retrouvez les paroisses les plus proches de vous';

  @override
  String get onboardingSlide3 => 'Enregistrez vos paroisses favorites';

  @override
  String get searchTitle => 'Recherche';

  @override
  String get searchTabListe => 'Liste';

  @override
  String get searchTabAutourDeMoi => 'Autour de moi';

  @override
  String get searchTabEnFete => 'En fête';

  @override
  String get searchAllCountries => 'Tous les pays';

  @override
  String get searchHintQuery => 'Rechercher par nom, ville ou région';

  @override
  String errorWithMessage(String error) {
    return 'Erreur : $error';
  }

  @override
  String get searchNoResults => 'Aucune paroisse trouvée.';

  @override
  String get searchEnableLocationPrompt =>
      'Activez votre position pour voir les paroisses les plus proches de vous.';

  @override
  String get searchEnableLocationButton => 'Activer ma position';

  @override
  String get searchNoGpsParoisses =>
      'Aucune paroisse avec coordonnées GPS pour le moment.';

  @override
  String get searchNoEnFete => 'Aucune paroisse en fête ce mois-ci.';

  @override
  String searchFeteLe(String date) {
    return 'Fête le $date';
  }

  @override
  String get detailCannotOpenMaps => 'Impossible d\'ouvrir Google Maps.';

  @override
  String get detailShareTooltip => 'Partager cette paroisse';

  @override
  String get labelRegion => 'Région';

  @override
  String get labelSousRegion => 'Sous-région';

  @override
  String get labelVille => 'Ville';

  @override
  String get labelChargeParoissial => 'Chargé paroissial';

  @override
  String get labelContact => 'Contact';

  @override
  String get labelSiteWeb => 'Site web';

  @override
  String get labelFeteParoisse => 'Fête de la paroisse';

  @override
  String get detailShareItineraireLabel => 'Itinéraire';

  @override
  String get detailShareFooter =>
      'Partagé depuis ilemO, l\'annuaire des paroisses de l\'ECC.';

  @override
  String get detailGoButton => 'Go — Itinéraire';

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get favoritesEmptyMessage =>
      'Aucune paroisse favorite pour l\'instant.\nAjoutez-en depuis la recherche en appuyant sur le cœur.';

  @override
  String get actualitesTitle => 'Actualités';

  @override
  String get actualitesEmptyMessage => 'Aucune actualité pour le moment.';

  @override
  String get actualitesEnSavoirPlus => 'En savoir plus';

  @override
  String get profileTitle => 'Profil';

  @override
  String get profileUserName => 'Utilisateur ilemO';

  @override
  String get profileConnexionNotice => 'Connexion non requise pour le moment';

  @override
  String get profileMesFavoris => 'Mes favoris';

  @override
  String get profileFavorisNone => 'Aucune paroisse enregistrée';

  @override
  String profileFavorisCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# paroisses enregistrées',
      one: '# paroisse enregistrée',
    );
    return '$_temp0';
  }

  @override
  String get profileLangue => 'Langue';

  @override
  String get profileChooseLangueTitle => 'Choisir la langue';

  @override
  String get profileAPropos => 'À propos d\'ilemO';

  @override
  String get profileVersionSubtitle => 'Version 1.0.0 — Bénin';

  @override
  String get profilePartagerApp => 'Partager l\'app';

  @override
  String get profilePartagerAppSubtitle =>
      'Faites connaître ilemO autour de vous';

  @override
  String get profileShareText =>
      'Découvrez ilemO, l\'application qui centralise les paroisses de l\'Église du Christianisme Céleste au Bénin !';

  @override
  String get profileAide => 'Aide';

  @override
  String get profileAideSubtitle => 'Comment utiliser l\'application';

  @override
  String get profilePrivacy => 'Politique de confidentialité';

  @override
  String get profilePrivacySubtitle => 'Comment vos données sont traitées';

  @override
  String get profileModeSombre => 'Mode sombre';

  @override
  String get profileCreerCompte => 'Créer un compte';

  @override
  String get profileBientotDisponible => 'Bientôt disponible';

  @override
  String get aboutDialogDescription =>
      'Application de centralisation des paroisses de l\'Église du Christianisme Céleste.';

  @override
  String get aboutDialogRole => 'Développeur Fullstack Web & Mobile';

  @override
  String get aboutDialogClose => 'Fermer';

  @override
  String get aboutDialogCredits => 'Conception et développement :';

  @override
  String get aideTitle => 'Aide';

  @override
  String get aideAccueilTitle => 'Accueil';

  @override
  String get aideAccueilDesc =>
      'L\'écran d\'accueil affiche l\'emblème de l\'Église du Christianisme Céleste, un aperçu en direct du nombre de paroisses référencées, ainsi qu\'un carrousel de présentation. Vous y retrouvez aussi une carte \"En fête ce mois\" qui met en avant les paroisses célébrant leur fête ce mois-ci, et un aperçu des dernières actualités.';

  @override
  String get aideListeTitle => 'Recherche — Liste';

  @override
  String get aideListeDesc =>
      'Parcourez l\'ensemble des paroisses enregistrées, filtrez par pays et effectuez une recherche par nom, ville, région ou sous-région pour retrouver rapidement une paroisse précise.';

  @override
  String get aideAutourDeMoiTitle => 'Recherche — Autour de moi';

  @override
  String get aideAutourDeMoiDesc =>
      'En activant votre position, cet onglet classe les paroisses de la plus proche à la plus éloignée de vous. Votre position n\'est utilisée que ponctuellement, sur votre appareil, et n\'est jamais envoyée ni stockée sur nos serveurs.';

  @override
  String get aideEnFeteTitle => 'Recherche — En fête';

  @override
  String get aideEnFeteDesc =>
      'Retrouvez ici toutes les paroisses qui célèbrent leur fête au cours du mois en cours, classées par jour de célébration.';

  @override
  String get aideDetailTitle => 'Détail d\'une paroisse';

  @override
  String get aideDetailDesc =>
      'En sélectionnant une paroisse, vous accédez à sa fiche complète : chargé paroissial, contact, ville, région, site web s\'il existe, lien vers Google Maps, et date de fête.';

  @override
  String get aideFavorisTitle => 'Favoris';

  @override
  String get aideFavorisDesc =>
      'Appuyez sur le cœur d\'une paroisse pour l\'ajouter à vos favoris et la retrouver rapidement depuis l\'onglet dédié. Vos favoris sont conservés uniquement sur votre appareil.';

  @override
  String get aideActualitesTitle => 'Actualités';

  @override
  String get aideActualitesDesc =>
      'Consultez les dernières actualités publiées, avec la possibilité d\'accéder à un lien \"En savoir plus\" pour chaque actualité lorsqu\'il est disponible.';

  @override
  String get aideModeSombreTitle => 'Mode sombre';

  @override
  String get aideModeSombreDesc =>
      'Depuis votre profil, vous pouvez basculer entre le thème clair et le thème sombre selon votre préférence. Ce choix est mémorisé sur votre appareil.';

  @override
  String get aideProfilTitle => 'Profil';

  @override
  String get aideProfilDesc =>
      'Retrouvez vos favoris, les informations \"À propos\" de l\'application, la possibilité de la partager, le réglage du mode sombre, ainsi que l\'aide et la politique de confidentialité.';

  @override
  String get privacyTitle => 'Politique de confidentialité';

  @override
  String privacyLastUpdated(String date) {
    return 'Dernière mise à jour : $date';
  }

  @override
  String get privacySection1Title => '1. Qui sommes-nous';

  @override
  String get privacySection1Body =>
      'ilemO est une application indépendante créée pour centraliser les informations des paroisses de l\'Église du Christianisme Céleste (ECC) au Bénin, avec une vocation à s\'étendre à d\'autres pays africains. Elle est développée et maintenue par un développeur indépendant, en dehors de toute structure administrative officielle de l\'ECC.';

  @override
  String get privacySection2Title => '2. Données que nous collectons';

  @override
  String get privacySection2Body =>
      'ilemO est conçue pour fonctionner avec le minimum de données personnelles possible :\n\n• Géolocalisation : utilisée uniquement, ponctuellement et localement sur votre appareil, pour trouver les paroisses les plus proches de vous (fonctionnalité \"Autour de moi\"). Cette position n\'est jamais envoyée à nos serveurs ni stockée.\n\n• Favoris : les paroisses que vous marquez comme favorites sont enregistrées uniquement sur votre appareil (stockage local), et ne sont jamais transmises ni partagées.\n\n• Préférence d\'affichage : votre choix de thème clair ou sombre est également conservé localement sur votre appareil.';

  @override
  String get privacySection3Title =>
      '3. Ce que nous ne collectons pas (pour l\'instant)';

  @override
  String get privacySection3Body =>
      'À ce jour, ilemO ne crée pas de compte utilisateur, ne demande ni nom, ni e-mail, ni numéro de téléphone, et n\'envoie aucune notification push. Aucune donnée personnelle nominative n\'est donc collectée par l\'application dans sa version actuelle.';

  @override
  String get privacySection4Title => '4. Services tiers utilisés';

  @override
  String get privacySection4Body =>
      'Les informations des paroisses (nom, région, contact, coordonnées GPS, etc.) sont hébergées sur Firebase / Google Cloud (Google LLC), qui applique ses propres règles de sécurité et de confidentialité. La fonctionnalité de localisation et d\'ouverture d\'itinéraires peut faire appel à Google Maps. Ces services tiers peuvent, dans le cadre de leur propre politique, traiter certaines données techniques (adresse IP, type d\'appareil) nécessaires à leur fonctionnement.';

  @override
  String get privacySection5Title => '5. Vos droits';

  @override
  String get privacySection5Body =>
      'Conformément à la loi béninoise n° 2017-20 du 20 avril 2018 portant Code du numérique en République du Bénin, relative notamment à la protection des données à caractère personnel, et sous le contrôle de l\'Autorité de Protection des Données Personnelles (APDP), toute personne dispose d\'un droit d\'accès, de rectification et de suppression des données la concernant. Dans la mesure où ilemO ne collecte aujourd\'hui aucune donnée personnelle nominative sur ses serveurs, l\'exercice de ces droits s\'applique principalement aux données stockées localement sur votre appareil, que vous pouvez supprimer à tout moment via les réglages de l\'application ou en désinstallant l\'application.';

  @override
  String get privacySection6Title => '6. Évolution future de cette politique';

  @override
  String get privacySection6Body =>
      'Si de nouvelles fonctionnalités venaient à nécessiter la création d\'un compte, l\'envoi de notifications, ou toute autre collecte de données personnelles, cette politique de confidentialité sera mise à jour au préalable, et la nouvelle version sera rendue disponible dans l\'application et sur cette page.';

  @override
  String get privacySection7Title => '7. Enfants';

  @override
  String get privacySection7Body =>
      'ilemO n\'est pas destinée à un usage ciblé par des enfants et ne collecte sciemment aucune donnée personnelle concernant des mineurs.';

  @override
  String get privacySection8Title => '8. Contact';

  @override
  String get privacySection8Body =>
      'Pour toute question concernant cette politique de confidentialité ou l\'application ilemO, vous pouvez nous contacter via les informations de contact disponibles dans la section \"À propos\" de l\'application.';
}
