// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Yoruba (`yo`).
class AppLocalizationsYo extends AppLocalizations {
  AppLocalizationsYo([String locale = 'yo']) : super(locale);

  @override
  String get navAccueil => 'Ilé';

  @override
  String get navRecherche => 'Àwárí';

  @override
  String get navFavoris => 'Ààyò';

  @override
  String get navProfil => 'Àkọsílẹ̀';

  @override
  String get homeChurchTagline => 'Àwọn ìjọ Ijo Mimo ti Kristi lati Orun wa';

  @override
  String get homeWelcomeTitle => 'Kaabo';

  @override
  String get homeWelcomeSubtitle => 'Wa alaye ati ipo ijọ eyikeyi ni kiakia.';

  @override
  String get homeLoadingParoisses => 'Ń gbé àwọn ìjọ wọlé…';

  @override
  String homeParoissesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Àwọn ìjọ # ni a ti forúkọ sílẹ̀',
      one: 'Ìjọ # ni a ti forúkọ sílẹ̀',
    );
    return '$_temp0';
  }

  @override
  String get homeSearchButton => 'Wa ijọ kan';

  @override
  String homeEnFeteBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Àwọn ìjọ # ń ṣe àjọyọ̀ oṣù yìí — ẹ lọ wò!',
      one: 'Ìjọ # ń ṣe àjọyọ̀ oṣù yìí — ẹ lọ wò!',
    );
    return '$_temp0';
  }

  @override
  String get sectionActualites => 'Ìròyìn';

  @override
  String get homeVoirTout => 'Wo gbogbo rẹ̀';

  @override
  String get onboardingSlide1 => 'Wo àkójọpọ̀ gbogbo àwọn ìjọ';

  @override
  String get onboardingSlide2 => 'Wa àwọn ìjọ tó sún mọ́ ọ jùlọ';

  @override
  String get onboardingSlide3 => 'Fi àwọn ìjọ tó fẹ́ràn rẹ̀ pamọ́';

  @override
  String get searchTitle => 'Àwáàrí';

  @override
  String get searchTabListe => 'Àkọsílẹ̀';

  @override
  String get searchTabAutourDeMoi => 'Àyíká mi';

  @override
  String get searchTabEnFete => 'Ń ṣe àjọyọ̀';

  @override
  String get searchAllCountries => 'Gbogbo orílẹ̀-èdè';

  @override
  String get searchHintQuery => 'Wa nípa orúkọ, ìlú tàbí agbègbè';

  @override
  String errorWithMessage(String error) {
    return 'Àṣìṣe: $error';
  }

  @override
  String get searchNoResults => 'A kò rí ìjọ kankan.';

  @override
  String get searchEnableLocationPrompt =>
      'Ṣí ipò rẹ láti rí àwọn ìjọ tó sún mọ́ ọ jùlọ.';

  @override
  String get searchEnableLocationButton => 'Ṣí ipò mi';

  @override
  String get searchNoGpsParoisses => 'Kò sí ìjọ pẹ̀lú ipò GPS síbẹ̀.';

  @override
  String get searchNoEnFete => 'Kò sí ìjọ tí ń ṣe àjọyọ̀ oṣù yìí.';

  @override
  String searchFeteLe(String date) {
    return 'Àjọyọ̀ ní $date';
  }

  @override
  String get detailCannotOpenMaps => 'A kò lè ṣí Google Maps.';

  @override
  String get detailShareTooltip => 'Pín ìjọ yìí';

  @override
  String get labelRegion => 'Agbègbè';

  @override
  String get labelSousRegion => 'Abẹ́-agbègbè';

  @override
  String get labelVille => 'Ìlú';

  @override
  String get labelChargeParoissial => 'Aṣáájú ìjọ';

  @override
  String get labelContact => 'Kọ́ǹtákì';

  @override
  String get labelSiteWeb => 'Ojú-òpó wẹ́ẹ̀bù';

  @override
  String get labelFeteParoisse => 'Àjọyọ̀ ìjọ';

  @override
  String get detailShareItineraireLabel => 'Ọ̀nà';

  @override
  String get detailShareFooter => 'Pín láti ọwọ́ ilemO, àkójọpọ̀ àwọn ìjọ CCC.';

  @override
  String get detailGoButton => 'Lọ — Ọ̀nà';

  @override
  String get favoritesTitle => 'Àwọn Àyànfẹ́';

  @override
  String get favoritesEmptyMessage =>
      'Kò sí ìjọ àyànfẹ́ síbẹ̀.\nFi kún un láti orí àwáàrí nípa títẹ ọkàn.';

  @override
  String get actualitesTitle => 'Ìròyìn';

  @override
  String get actualitesEmptyMessage => 'Kò sí ìròyìn sí ìsinsìnyí.';

  @override
  String get actualitesEnSavoirPlus => 'Mọ̀ síi';

  @override
  String get profileTitle => 'Ìwé Àkọsílẹ̀';

  @override
  String get profileUserName => 'Olùmúlò ilemO';

  @override
  String get profileConnexionNotice => 'Kò nílò ìforúkọsílẹ̀ nísisìyí';

  @override
  String get profileMesFavoris => 'Àwọn àyànfẹ́ mi';

  @override
  String get profileFavorisNone => 'Kò sí ìjọ tí a fi pamọ́';

  @override
  String profileFavorisCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Àwọn ìjọ # ni a ti fi pamọ́',
      one: 'Ìjọ # ni a ti fi pamọ́',
    );
    return '$_temp0';
  }

  @override
  String get profileLangue => 'Èdè';

  @override
  String get profileChooseLangueTitle => 'Yan èdè';

  @override
  String get profileAPropos => 'Nípa ilemO';

  @override
  String get profileVersionSubtitle => 'Ẹ̀dà 1.0.0 — Bẹ̀nẹ̀';

  @override
  String get profilePartagerApp => 'Pín app náà';

  @override
  String get profilePartagerAppSubtitle => 'Sọ fún àwọn ẹlòmíràn nípa ilemO';

  @override
  String get profileShareText =>
      'Ṣàwárí ilemO, app tó ń kó gbogbo àwọn ìjọ Ijo Mimo ti Kristi lati Orun wa jọ ní Bẹ̀nẹ̀!';

  @override
  String get profileAide => 'Ìrànlọ́wọ́';

  @override
  String get profileAideSubtitle => 'Bí a ṣe ń lo app náà';

  @override
  String get profilePrivacy => 'Ìlànà àṣírí';

  @override
  String get profilePrivacySubtitle => 'Bí a ṣe ń mú àwọn dátà rẹ';

  @override
  String get profileModeSombre => 'Ipò dúdú';

  @override
  String get profileCreerCompte => 'Ṣẹ̀dá àkáǹtì';

  @override
  String get profileBientotDisponible => 'Ń bọ̀ láìpẹ́';

  @override
  String get aboutDialogDescription =>
      'App tó ń kó gbogbo àwọn ìjọ Ijo Mimo ti Kristi lati Orun wa jọ.';

  @override
  String get aboutDialogRole => 'Olùdàgbàsókè Fullstack Wẹ́ẹ̀bù & Mobile';

  @override
  String get aboutDialogClose => 'Ti';

  @override
  String get aboutDialogCredits => 'Ìṣàgbékalẹ̀ àti ìdàgbàsókè:';

  @override
  String get aideTitle => 'Ìrànlọ́wọ́';

  @override
  String get aideAccueilTitle => 'Ilé';

  @override
  String get aideAccueilDesc =>
      'Ojú ìwé Ilé fi àmì Ijo Mimo ti Kristi lati Orun wa hàn, iye àwọn ìjọ tí a ti forúkọ sílẹ̀ lọ́wọ́lọ́wọ́, àti àwòrán ìfihàn. Ẹ ó tún rí káàdì \"Ń ṣe àjọyọ̀ oṣù yìí\" tí ó ń fi hàn àwọn ìjọ tí ń ṣe àjọyọ̀ oṣù yìí, àti àwòrán àwọn ìròyìn tuntun.';

  @override
  String get aideListeTitle => 'Àwáàrí — Àkọsílẹ̀';

  @override
  String get aideListeDesc =>
      'Wo gbogbo àwọn ìjọ tí a ti forúkọ sílẹ̀, ṣe àyẹ̀wò nípa orílẹ̀-èdè, kí o sì wá nípa orúkọ, ìlú, agbègbè tàbí abẹ́-agbègbè láti rí ìjọ kan pàtó.';

  @override
  String get aideAutourDeMoiTitle => 'Àwáàrí — Àyíká mi';

  @override
  String get aideAutourDeMoiDesc =>
      'Nígbà tí o bá ṣí ipò rẹ, ojú-ìwé yìí máa ń tò àwọn ìjọ láti ọ̀dọ̀ tí ó sún mọ́ ọ jùlọ dé ọ̀dọ̀ tí ó jìnnà jùlọ. Ipò rẹ kìí ṣàmúlò rẹ̀ ju ìgbà kan lọ, lórí ẹ̀rọ rẹ nìkan, a kìí rán an tàbí kó pamọ́ sórí àwọn sáfà wa.';

  @override
  String get aideEnFeteTitle => 'Àwáàrí — Ń ṣe àjọyọ̀';

  @override
  String get aideEnFeteDesc =>
      'Rí gbogbo àwọn ìjọ tí ń ṣe àjọyọ̀ ní oṣù yìí, tí a tò gẹ́gẹ́ bí ọjọ́ àjọyọ̀.';

  @override
  String get aideDetailTitle => 'Àlàyé ìjọ kan';

  @override
  String get aideDetailDesc =>
      'Nígbà tí o bá yan ìjọ kan, o máa rí gbogbo àlàyé rẹ̀: aṣáájú ìjọ, kọ́ǹtákì, ìlú, agbègbè, ojú-òpó wẹ́ẹ̀bù bí ó bá wà, ọ̀nà sí Google Maps, àti ọjọ́ àjọyọ̀.';

  @override
  String get aideFavorisTitle => 'Àwọn Àyànfẹ́';

  @override
  String get aideFavorisDesc =>
      'Tẹ ọkàn ìjọ kan láti fi kún àwọn àyànfẹ́ rẹ kí o sì rí i kíákíá láti orí ojú-ìwé tó yẹ. Àwọn àyànfẹ́ rẹ ni a ó fi pamọ́ sórí ẹ̀rọ rẹ nìkan.';

  @override
  String get aideActualitesTitle => 'Ìròyìn';

  @override
  String get aideActualitesDesc =>
      'Wo àwọn ìròyìn tuntun tí a tẹ̀ jáde, pẹ̀lú àṣàyàn láti tẹ ọ̀nà \"Mọ̀ síi\" fún ìròyìn kọ̀ọ̀kan bí ó bá wà.';

  @override
  String get aideModeSombreTitle => 'Ipò dúdú';

  @override
  String get aideModeSombreDesc =>
      'Láti orí àkọsílẹ̀ rẹ, o lè yí padà láàrin ìtọ́ka funfun àti dúdú gẹ́gẹ́ bí ìfẹ́ rẹ. Yíyàn yìí ni a ó rántí sórí ẹ̀rọ rẹ.';

  @override
  String get aideProfilTitle => 'Àkọsílẹ̀';

  @override
  String get aideProfilDesc =>
      'Rí àwọn àyànfẹ́ rẹ, àlàyé \"Nípa\" app náà, àṣàyàn láti pín in, ìtòsórí ipò dúdú, àti ìrànlọ́wọ́ àti ìlànà àṣírí.';

  @override
  String get privacyTitle => 'Ìlànà Àṣírí';

  @override
  String privacyLastUpdated(String date) {
    return 'Ìmúdójúiwọ̀n kẹ́yìn: $date';
  }

  @override
  String get privacySection1Title => '1. Ta ni àwa';

  @override
  String get privacySection1Body =>
      'ilemO est une application indépendante créée pour centraliser les informations des paroisses de l\'Église du Christianisme Céleste (ECC) au Bénin, avec une vocation à s\'étendre à d\'autres pays africains. Elle est développée et maintenue par un développeur indépendant, en dehors de toute structure administrative officielle de l\'ECC.';

  @override
  String get privacySection2Title => '2. Àwọn dátà tí a ń kójọ';

  @override
  String get privacySection2Body =>
      'ilemO est conçue pour fonctionner avec le minimum de données personnelles possible :\n\n• Géolocalisation : utilisée uniquement, ponctuellement et localement sur votre appareil, pour trouver les paroisses les plus proches de vous (fonctionnalité \"Autour de moi\"). Cette position n\'est jamais envoyée à nos serveurs ni stockée.\n\n• Favoris : les paroisses que vous marquez comme favorites sont enregistrées uniquement sur votre appareil (stockage local), et ne sont jamais transmises ni partagées.\n\n• Préférence d\'affichage : votre choix de thème clair ou sombre est également conservé localement sur votre appareil.';

  @override
  String get privacySection3Title => '3. Ohun tí a kò kójọ (fún ìsinsìnyí)';

  @override
  String get privacySection3Body =>
      'À ce jour, ilemO ne crée pas de compte utilisateur, ne demande ni nom, ni e-mail, ni numéro de téléphone, et n\'envoie aucune notification push. Aucune donnée personnelle nominative n\'est donc collectée par l\'application dans sa version actuelle.';

  @override
  String get privacySection4Title => '4. Àwọn iṣẹ́ ẹgbẹ́ kẹta tí a ń lò';

  @override
  String get privacySection4Body =>
      'Les informations des paroisses (nom, région, contact, coordonnées GPS, etc.) sont hébergées sur Firebase / Google Cloud (Google LLC), qui applique ses propres règles de sécurité et de confidentialité. La fonctionnalité de localisation et d\'ouverture d\'itinéraires peut faire appel à Google Maps. Ces services tiers peuvent, dans le cadre de leur propre politique, traiter certaines données techniques (adresse IP, type d\'appareil) nécessaires à leur fonctionnement.';

  @override
  String get privacySection5Title => '5. Àwọn ẹ̀tọ́ rẹ';

  @override
  String get privacySection5Body =>
      'Conformément à la loi béninoise n° 2017-20 du 20 avril 2018 portant Code du numérique en République du Bénin, relative notamment à la protection des données à caractère personnel, et sous le contrôle de l\'Autorité de Protection des Données Personnelles (APDP), toute personne dispose d\'un droit d\'accès, de rectification et de suppression des données la concernant. Dans la mesure où ilemO ne collecte aujourd\'hui aucune donnée personnelle nominative sur ses serveurs, l\'exercice de ces droits s\'applique principalement aux données stockées localement sur votre appareil, que vous pouvez supprimer à tout moment via les réglages de l\'application ou en désinstallant l\'application.';

  @override
  String get privacySection6Title => '6. Ìdàgbàsókè ìlànà yìí ní ọjọ́ ọ̀la';

  @override
  String get privacySection6Body =>
      'Si de nouvelles fonctionnalités venaient à nécessiter la création d\'un compte, l\'envoi de notifications, ou toute autre collecte de données personnelles, cette politique de confidentialité sera mise à jour au préalable, et la nouvelle version sera rendue disponible dans l\'application et sur cette page.';

  @override
  String get privacySection7Title => '7. Àwọn ọmọdé';

  @override
  String get privacySection7Body =>
      'ilemO n\'est pas destinée à un usage ciblé par des enfants et ne collecte sciemment aucune donnée personnelle concernant des mineurs.';

  @override
  String get privacySection8Title => '8. Kọ́ǹtákì';

  @override
  String get privacySection8Body =>
      'Pour toute question concernant cette politique de confidentialité ou l\'application ilemO, vous pouvez nous contacter via les informations de contact disponibles dans la section \"À propos\" de l\'application.';
}
