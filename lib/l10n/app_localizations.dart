import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_guw.dart';
import 'app_localizations_yo.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('guw'),
    Locale('yo'),
  ];

  /// Libellé de l'onglet Accueil dans la barre de navigation
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navAccueil;

  /// Libellé de l'onglet Recherche dans la barre de navigation
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get navRecherche;

  /// Libellé de l'onglet Favoris dans la barre de navigation
  ///
  /// In fr, this message translates to:
  /// **'Favori'**
  String get navFavoris;

  /// Libellé de l'onglet Profil dans la barre de navigation
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get navProfil;

  /// No description provided for @homeChurchTagline.
  ///
  /// In fr, this message translates to:
  /// **'Paroisses de l\'Église du Christianisme Céleste'**
  String get homeChurchTagline;

  /// No description provided for @homeWelcomeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue'**
  String get homeWelcomeTitle;

  /// No description provided for @homeWelcomeSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez rapidement les informations et la localisation de n\'importe quelle paroisse.'**
  String get homeWelcomeSubtitle;

  /// No description provided for @homeLoadingParoisses.
  ///
  /// In fr, this message translates to:
  /// **'Chargement des paroisses…'**
  String get homeLoadingParoisses;

  /// No description provided for @homeParoissesCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{# paroisse référencée} other{# paroisses référencées}}'**
  String homeParoissesCount(int count);

  /// No description provided for @homeSearchButton.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher une paroisse'**
  String get homeSearchButton;

  /// No description provided for @homeEnFeteBanner.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{# paroisse en fête ce mois-ci — à visiter !} other{# paroisses en fête ce mois-ci — à visiter !}}'**
  String homeEnFeteBanner(int count);

  /// No description provided for @sectionActualites.
  ///
  /// In fr, this message translates to:
  /// **'Actualités'**
  String get sectionActualites;

  /// No description provided for @homeVoirTout.
  ///
  /// In fr, this message translates to:
  /// **'Voir tout'**
  String get homeVoirTout;

  /// No description provided for @onboardingSlide1.
  ///
  /// In fr, this message translates to:
  /// **'Parcourez l\'annuaire de toutes les paroisses'**
  String get onboardingSlide1;

  /// No description provided for @onboardingSlide2.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez les paroisses les plus proches de vous'**
  String get onboardingSlide2;

  /// No description provided for @onboardingSlide3.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrez vos paroisses favorites'**
  String get onboardingSlide3;

  /// No description provided for @searchTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche'**
  String get searchTitle;

  /// No description provided for @searchTabListe.
  ///
  /// In fr, this message translates to:
  /// **'Liste'**
  String get searchTabListe;

  /// No description provided for @searchTabAutourDeMoi.
  ///
  /// In fr, this message translates to:
  /// **'Autour de moi'**
  String get searchTabAutourDeMoi;

  /// No description provided for @searchTabEnFete.
  ///
  /// In fr, this message translates to:
  /// **'En fête'**
  String get searchTabEnFete;

  /// No description provided for @searchAllCountries.
  ///
  /// In fr, this message translates to:
  /// **'Tous les pays'**
  String get searchAllCountries;

  /// No description provided for @searchHintQuery.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher par nom, ville ou région'**
  String get searchHintQuery;

  /// No description provided for @errorWithMessage.
  ///
  /// In fr, this message translates to:
  /// **'Erreur : {error}'**
  String errorWithMessage(String error);

  /// No description provided for @searchNoResults.
  ///
  /// In fr, this message translates to:
  /// **'Aucune paroisse trouvée.'**
  String get searchNoResults;

  /// No description provided for @searchEnableLocationPrompt.
  ///
  /// In fr, this message translates to:
  /// **'Activez votre position pour voir les paroisses les plus proches de vous.'**
  String get searchEnableLocationPrompt;

  /// No description provided for @searchEnableLocationButton.
  ///
  /// In fr, this message translates to:
  /// **'Activer ma position'**
  String get searchEnableLocationButton;

  /// No description provided for @searchNoGpsParoisses.
  ///
  /// In fr, this message translates to:
  /// **'Aucune paroisse avec coordonnées GPS pour le moment.'**
  String get searchNoGpsParoisses;

  /// No description provided for @searchNoEnFete.
  ///
  /// In fr, this message translates to:
  /// **'Aucune paroisse en fête ce mois-ci.'**
  String get searchNoEnFete;

  /// No description provided for @searchFeteLe.
  ///
  /// In fr, this message translates to:
  /// **'Fête le {date}'**
  String searchFeteLe(String date);

  /// No description provided for @detailCannotOpenMaps.
  ///
  /// In fr, this message translates to:
  /// **'Impossible d\'ouvrir Google Maps.'**
  String get detailCannotOpenMaps;

  /// No description provided for @detailShareTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Partager cette paroisse'**
  String get detailShareTooltip;

  /// No description provided for @labelRegion.
  ///
  /// In fr, this message translates to:
  /// **'Région'**
  String get labelRegion;

  /// No description provided for @labelSousRegion.
  ///
  /// In fr, this message translates to:
  /// **'Sous-région'**
  String get labelSousRegion;

  /// No description provided for @labelVille.
  ///
  /// In fr, this message translates to:
  /// **'Ville'**
  String get labelVille;

  /// No description provided for @labelChargeParoissial.
  ///
  /// In fr, this message translates to:
  /// **'Chargé paroissial'**
  String get labelChargeParoissial;

  /// No description provided for @labelContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get labelContact;

  /// No description provided for @labelSiteWeb.
  ///
  /// In fr, this message translates to:
  /// **'Site web'**
  String get labelSiteWeb;

  /// No description provided for @labelFeteParoisse.
  ///
  /// In fr, this message translates to:
  /// **'Fête de la paroisse'**
  String get labelFeteParoisse;

  /// No description provided for @detailShareItineraireLabel.
  ///
  /// In fr, this message translates to:
  /// **'Itinéraire'**
  String get detailShareItineraireLabel;

  /// No description provided for @detailShareFooter.
  ///
  /// In fr, this message translates to:
  /// **'Partagé depuis ilemO, l\'annuaire des paroisses de l\'ECC.'**
  String get detailShareFooter;

  /// No description provided for @detailGoButton.
  ///
  /// In fr, this message translates to:
  /// **'Go — Itinéraire'**
  String get detailGoButton;

  /// No description provided for @favoritesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Aucune paroisse favorite pour l\'instant.\nAjoutez-en depuis la recherche en appuyant sur le cœur.'**
  String get favoritesEmptyMessage;

  /// No description provided for @actualitesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Actualités'**
  String get actualitesTitle;

  /// No description provided for @actualitesEmptyMessage.
  ///
  /// In fr, this message translates to:
  /// **'Aucune actualité pour le moment.'**
  String get actualitesEmptyMessage;

  /// No description provided for @actualitesEnSavoirPlus.
  ///
  /// In fr, this message translates to:
  /// **'En savoir plus'**
  String get actualitesEnSavoirPlus;

  /// No description provided for @profileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get profileTitle;

  /// No description provided for @profileUserName.
  ///
  /// In fr, this message translates to:
  /// **'Utilisateur ilemO'**
  String get profileUserName;

  /// No description provided for @profileConnexionNotice.
  ///
  /// In fr, this message translates to:
  /// **'Connexion non requise pour le moment'**
  String get profileConnexionNotice;

  /// No description provided for @profileMesFavoris.
  ///
  /// In fr, this message translates to:
  /// **'Mes favoris'**
  String get profileMesFavoris;

  /// No description provided for @profileFavorisNone.
  ///
  /// In fr, this message translates to:
  /// **'Aucune paroisse enregistrée'**
  String get profileFavorisNone;

  /// No description provided for @profileFavorisCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, one{# paroisse enregistrée} other{# paroisses enregistrées}}'**
  String profileFavorisCount(int count);

  /// No description provided for @profileLangue.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get profileLangue;

  /// No description provided for @profileChooseLangueTitle.
  ///
  /// In fr, this message translates to:
  /// **'Choisir la langue'**
  String get profileChooseLangueTitle;

  /// No description provided for @profileAPropos.
  ///
  /// In fr, this message translates to:
  /// **'À propos d\'ilemO'**
  String get profileAPropos;

  /// No description provided for @profileVersionSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Version 1.0.0 — Bénin'**
  String get profileVersionSubtitle;

  /// No description provided for @profilePartagerApp.
  ///
  /// In fr, this message translates to:
  /// **'Partager l\'app'**
  String get profilePartagerApp;

  /// No description provided for @profilePartagerAppSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Faites connaître ilemO autour de vous'**
  String get profilePartagerAppSubtitle;

  /// No description provided for @profileShareText.
  ///
  /// In fr, this message translates to:
  /// **'Découvrez ilemO, l\'application qui centralise les paroisses de l\'Église du Christianisme Céleste au Bénin !'**
  String get profileShareText;

  /// No description provided for @profileAide.
  ///
  /// In fr, this message translates to:
  /// **'Aide'**
  String get profileAide;

  /// No description provided for @profileAideSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment utiliser l\'application'**
  String get profileAideSubtitle;

  /// No description provided for @profilePrivacy.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get profilePrivacy;

  /// No description provided for @profilePrivacySubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Comment vos données sont traitées'**
  String get profilePrivacySubtitle;

  /// No description provided for @profileModeSombre.
  ///
  /// In fr, this message translates to:
  /// **'Mode sombre'**
  String get profileModeSombre;

  /// No description provided for @profileCreerCompte.
  ///
  /// In fr, this message translates to:
  /// **'Créer un compte'**
  String get profileCreerCompte;

  /// No description provided for @profileBientotDisponible.
  ///
  /// In fr, this message translates to:
  /// **'Bientôt disponible'**
  String get profileBientotDisponible;

  /// No description provided for @aboutDialogDescription.
  ///
  /// In fr, this message translates to:
  /// **'Application de centralisation des paroisses de l\'Église du Christianisme Céleste.'**
  String get aboutDialogDescription;

  /// No description provided for @aboutDialogRole.
  ///
  /// In fr, this message translates to:
  /// **'Développeur Fullstack Web & Mobile'**
  String get aboutDialogRole;

  /// No description provided for @aboutDialogClose.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get aboutDialogClose;

  /// No description provided for @aboutDialogCredits.
  ///
  /// In fr, this message translates to:
  /// **'Conception et développement :'**
  String get aboutDialogCredits;

  /// No description provided for @aideTitle.
  ///
  /// In fr, this message translates to:
  /// **'Aide'**
  String get aideTitle;

  /// No description provided for @aideAccueilTitle.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get aideAccueilTitle;

  /// No description provided for @aideAccueilDesc.
  ///
  /// In fr, this message translates to:
  /// **'L\'écran d\'accueil affiche l\'emblème de l\'Église du Christianisme Céleste, un aperçu en direct du nombre de paroisses référencées, ainsi qu\'un carrousel de présentation. Vous y retrouvez aussi une carte \"En fête ce mois\" qui met en avant les paroisses célébrant leur fête ce mois-ci, et un aperçu des dernières actualités.'**
  String get aideAccueilDesc;

  /// No description provided for @aideListeTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche — Liste'**
  String get aideListeTitle;

  /// No description provided for @aideListeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Parcourez l\'ensemble des paroisses enregistrées, filtrez par pays et effectuez une recherche par nom, ville, région ou sous-région pour retrouver rapidement une paroisse précise.'**
  String get aideListeDesc;

  /// No description provided for @aideAutourDeMoiTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche — Autour de moi'**
  String get aideAutourDeMoiTitle;

  /// No description provided for @aideAutourDeMoiDesc.
  ///
  /// In fr, this message translates to:
  /// **'En activant votre position, cet onglet classe les paroisses de la plus proche à la plus éloignée de vous. Votre position n\'est utilisée que ponctuellement, sur votre appareil, et n\'est jamais envoyée ni stockée sur nos serveurs.'**
  String get aideAutourDeMoiDesc;

  /// No description provided for @aideEnFeteTitle.
  ///
  /// In fr, this message translates to:
  /// **'Recherche — En fête'**
  String get aideEnFeteTitle;

  /// No description provided for @aideEnFeteDesc.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez ici toutes les paroisses qui célèbrent leur fête au cours du mois en cours, classées par jour de célébration.'**
  String get aideEnFeteDesc;

  /// No description provided for @aideDetailTitle.
  ///
  /// In fr, this message translates to:
  /// **'Détail d\'une paroisse'**
  String get aideDetailTitle;

  /// No description provided for @aideDetailDesc.
  ///
  /// In fr, this message translates to:
  /// **'En sélectionnant une paroisse, vous accédez à sa fiche complète : chargé paroissial, contact, ville, région, site web s\'il existe, lien vers Google Maps, et date de fête.'**
  String get aideDetailDesc;

  /// No description provided for @aideFavorisTitle.
  ///
  /// In fr, this message translates to:
  /// **'Favoris'**
  String get aideFavorisTitle;

  /// No description provided for @aideFavorisDesc.
  ///
  /// In fr, this message translates to:
  /// **'Appuyez sur le cœur d\'une paroisse pour l\'ajouter à vos favoris et la retrouver rapidement depuis l\'onglet dédié. Vos favoris sont conservés uniquement sur votre appareil.'**
  String get aideFavorisDesc;

  /// No description provided for @aideActualitesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Actualités'**
  String get aideActualitesTitle;

  /// No description provided for @aideActualitesDesc.
  ///
  /// In fr, this message translates to:
  /// **'Consultez les dernières actualités publiées, avec la possibilité d\'accéder à un lien \"En savoir plus\" pour chaque actualité lorsqu\'il est disponible.'**
  String get aideActualitesDesc;

  /// No description provided for @aideModeSombreTitle.
  ///
  /// In fr, this message translates to:
  /// **'Mode sombre'**
  String get aideModeSombreTitle;

  /// No description provided for @aideModeSombreDesc.
  ///
  /// In fr, this message translates to:
  /// **'Depuis votre profil, vous pouvez basculer entre le thème clair et le thème sombre selon votre préférence. Ce choix est mémorisé sur votre appareil.'**
  String get aideModeSombreDesc;

  /// No description provided for @aideProfilTitle.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get aideProfilTitle;

  /// No description provided for @aideProfilDesc.
  ///
  /// In fr, this message translates to:
  /// **'Retrouvez vos favoris, les informations \"À propos\" de l\'application, la possibilité de la partager, le réglage du mode sombre, ainsi que l\'aide et la politique de confidentialité.'**
  String get aideProfilDesc;

  /// No description provided for @privacyTitle.
  ///
  /// In fr, this message translates to:
  /// **'Politique de confidentialité'**
  String get privacyTitle;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In fr, this message translates to:
  /// **'Dernière mise à jour : {date}'**
  String privacyLastUpdated(String date);

  /// No description provided for @privacySection1Title.
  ///
  /// In fr, this message translates to:
  /// **'1. Qui sommes-nous'**
  String get privacySection1Title;

  /// No description provided for @privacySection1Body.
  ///
  /// In fr, this message translates to:
  /// **'ilemO est une application indépendante créée pour centraliser les informations des paroisses de l\'Église du Christianisme Céleste (ECC) au Bénin, avec une vocation à s\'étendre à d\'autres pays africains. Elle est développée et maintenue par un développeur indépendant, en dehors de toute structure administrative officielle de l\'ECC.'**
  String get privacySection1Body;

  /// No description provided for @privacySection2Title.
  ///
  /// In fr, this message translates to:
  /// **'2. Données que nous collectons'**
  String get privacySection2Title;

  /// No description provided for @privacySection2Body.
  ///
  /// In fr, this message translates to:
  /// **'ilemO est conçue pour fonctionner avec le minimum de données personnelles possible :\n\n• Géolocalisation : utilisée uniquement, ponctuellement et localement sur votre appareil, pour trouver les paroisses les plus proches de vous (fonctionnalité \"Autour de moi\"). Cette position n\'est jamais envoyée à nos serveurs ni stockée.\n\n• Favoris : les paroisses que vous marquez comme favorites sont enregistrées uniquement sur votre appareil (stockage local), et ne sont jamais transmises ni partagées.\n\n• Préférence d\'affichage : votre choix de thème clair ou sombre est également conservé localement sur votre appareil.'**
  String get privacySection2Body;

  /// No description provided for @privacySection3Title.
  ///
  /// In fr, this message translates to:
  /// **'3. Ce que nous ne collectons pas (pour l\'instant)'**
  String get privacySection3Title;

  /// No description provided for @privacySection3Body.
  ///
  /// In fr, this message translates to:
  /// **'À ce jour, ilemO ne crée pas de compte utilisateur, ne demande ni nom, ni e-mail, ni numéro de téléphone, et n\'envoie aucune notification push. Aucune donnée personnelle nominative n\'est donc collectée par l\'application dans sa version actuelle.'**
  String get privacySection3Body;

  /// No description provided for @privacySection4Title.
  ///
  /// In fr, this message translates to:
  /// **'4. Services tiers utilisés'**
  String get privacySection4Title;

  /// No description provided for @privacySection4Body.
  ///
  /// In fr, this message translates to:
  /// **'Les informations des paroisses (nom, région, contact, coordonnées GPS, etc.) sont hébergées sur Firebase / Google Cloud (Google LLC), qui applique ses propres règles de sécurité et de confidentialité. La fonctionnalité de localisation et d\'ouverture d\'itinéraires peut faire appel à Google Maps. Ces services tiers peuvent, dans le cadre de leur propre politique, traiter certaines données techniques (adresse IP, type d\'appareil) nécessaires à leur fonctionnement.'**
  String get privacySection4Body;

  /// No description provided for @privacySection5Title.
  ///
  /// In fr, this message translates to:
  /// **'5. Vos droits'**
  String get privacySection5Title;

  /// No description provided for @privacySection5Body.
  ///
  /// In fr, this message translates to:
  /// **'Conformément à la loi béninoise n° 2017-20 du 20 avril 2018 portant Code du numérique en République du Bénin, relative notamment à la protection des données à caractère personnel, et sous le contrôle de l\'Autorité de Protection des Données Personnelles (APDP), toute personne dispose d\'un droit d\'accès, de rectification et de suppression des données la concernant. Dans la mesure où ilemO ne collecte aujourd\'hui aucune donnée personnelle nominative sur ses serveurs, l\'exercice de ces droits s\'applique principalement aux données stockées localement sur votre appareil, que vous pouvez supprimer à tout moment via les réglages de l\'application ou en désinstallant l\'application.'**
  String get privacySection5Body;

  /// No description provided for @privacySection6Title.
  ///
  /// In fr, this message translates to:
  /// **'6. Évolution future de cette politique'**
  String get privacySection6Title;

  /// No description provided for @privacySection6Body.
  ///
  /// In fr, this message translates to:
  /// **'Si de nouvelles fonctionnalités venaient à nécessiter la création d\'un compte, l\'envoi de notifications, ou toute autre collecte de données personnelles, cette politique de confidentialité sera mise à jour au préalable, et la nouvelle version sera rendue disponible dans l\'application et sur cette page.'**
  String get privacySection6Body;

  /// No description provided for @privacySection7Title.
  ///
  /// In fr, this message translates to:
  /// **'7. Enfants'**
  String get privacySection7Title;

  /// No description provided for @privacySection7Body.
  ///
  /// In fr, this message translates to:
  /// **'ilemO n\'est pas destinée à un usage ciblé par des enfants et ne collecte sciemment aucune donnée personnelle concernant des mineurs.'**
  String get privacySection7Body;

  /// No description provided for @privacySection8Title.
  ///
  /// In fr, this message translates to:
  /// **'8. Contact'**
  String get privacySection8Title;

  /// No description provided for @privacySection8Body.
  ///
  /// In fr, this message translates to:
  /// **'Pour toute question concernant cette politique de confidentialité ou l\'application ilemO, vous pouvez nous contacter via les informations de contact disponibles dans la section \"À propos\" de l\'application.'**
  String get privacySection8Body;

  /// No description provided for @profileRetour.
  ///
  /// In fr, this message translates to:
  /// **'Donner mon avis'**
  String get profileRetour;

  /// No description provided for @profileRetourSubtitle.
  ///
  /// In fr, this message translates to:
  /// **'Aidez-nous à améliorer ilemO'**
  String get profileRetourSubtitle;

  /// No description provided for @retourTitle.
  ///
  /// In fr, this message translates to:
  /// **'Donner mon avis'**
  String get retourTitle;

  /// No description provided for @retourIntro.
  ///
  /// In fr, this message translates to:
  /// **'Votre avis nous aide à améliorer ilemO. Vos coordonnées sont optionnelles et ne seront utilisées que si vous souhaitez une réponse.'**
  String get retourIntro;

  /// No description provided for @retourNoteLabel.
  ///
  /// In fr, this message translates to:
  /// **'Note'**
  String get retourNoteLabel;

  /// No description provided for @retourMessageLabel.
  ///
  /// In fr, this message translates to:
  /// **'Votre message'**
  String get retourMessageLabel;

  /// No description provided for @retourMessageHint.
  ///
  /// In fr, this message translates to:
  /// **'Partagez votre expérience, une suggestion, un problème rencontré…'**
  String get retourMessageHint;

  /// No description provided for @retourMessageRequired.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez écrire un message avant d\'envoyer.'**
  String get retourMessageRequired;

  /// No description provided for @retourNomLabel.
  ///
  /// In fr, this message translates to:
  /// **'Nom (optionnel)'**
  String get retourNomLabel;

  /// No description provided for @retourContactLabel.
  ///
  /// In fr, this message translates to:
  /// **'Contact (optionnel)'**
  String get retourContactLabel;

  /// No description provided for @retourContactHint.
  ///
  /// In fr, this message translates to:
  /// **'E-mail ou téléphone'**
  String get retourContactHint;

  /// No description provided for @retourSubmitButton.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer'**
  String get retourSubmitButton;

  /// No description provided for @retourSendingButton.
  ///
  /// In fr, this message translates to:
  /// **'Envoi en cours…'**
  String get retourSendingButton;

  /// No description provided for @retourSuccessTitle.
  ///
  /// In fr, this message translates to:
  /// **'Merci !'**
  String get retourSuccessTitle;

  /// No description provided for @retourSuccessMessage.
  ///
  /// In fr, this message translates to:
  /// **'Votre avis a bien été envoyé. Merci de nous aider à améliorer ilemO.'**
  String get retourSuccessMessage;

  /// No description provided for @retourSuccessClose.
  ///
  /// In fr, this message translates to:
  /// **'Fermer'**
  String get retourSuccessClose;

  /// No description provided for @retourErrorSending.
  ///
  /// In fr, this message translates to:
  /// **'Une erreur est survenue lors de l\'envoi. Veuillez réessayer.'**
  String get retourErrorSending;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'guw', 'yo'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'guw':
      return AppLocalizationsGuw();
    case 'yo':
      return AppLocalizationsYo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
