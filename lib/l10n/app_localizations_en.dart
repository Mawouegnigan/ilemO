// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navAccueil => 'Home';

  @override
  String get navRecherche => 'Search';

  @override
  String get navFavoris => 'Favorites';

  @override
  String get navProfil => 'Profile';

  @override
  String get homeChurchTagline => 'Parishes of the Celestial Church of Christ';

  @override
  String get homeWelcomeTitle => 'Welcome';

  @override
  String get homeWelcomeSubtitle =>
      'Quickly find information and location for any parish.';

  @override
  String get homeLoadingParoisses => 'Loading parishes…';

  @override
  String homeParoissesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# parishes listed',
      one: '# parish listed',
    );
    return '$_temp0';
  }

  @override
  String get homeSearchButton => 'Search for a parish';

  @override
  String homeEnFeteBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# parishes celebrating this month — worth a visit!',
      one: '# parish celebrating this month — worth a visit!',
    );
    return '$_temp0';
  }

  @override
  String get sectionActualites => 'News';

  @override
  String get homeVoirTout => 'See all';

  @override
  String get onboardingSlide1 => 'Browse the directory of all parishes';

  @override
  String get onboardingSlide2 => 'Find the parishes closest to you';

  @override
  String get onboardingSlide3 => 'Save your favorite parishes';

  @override
  String get searchTitle => 'Search';

  @override
  String get searchTabListe => 'List';

  @override
  String get searchTabAutourDeMoi => 'Nearby';

  @override
  String get searchTabEnFete => 'Celebrating';

  @override
  String get searchAllCountries => 'All countries';

  @override
  String get searchHintQuery => 'Search by name, city or region';

  @override
  String errorWithMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get searchNoResults => 'No parish found.';

  @override
  String get searchEnableLocationPrompt =>
      'Enable your location to see the parishes closest to you.';

  @override
  String get searchEnableLocationButton => 'Enable my location';

  @override
  String get searchNoGpsParoisses => 'No parish with GPS coordinates yet.';

  @override
  String get searchNoEnFete => 'No parish celebrating this month.';

  @override
  String searchFeteLe(String date) {
    return 'Celebration on $date';
  }

  @override
  String get detailCannotOpenMaps => 'Unable to open Google Maps.';

  @override
  String get detailShareTooltip => 'Share this parish';

  @override
  String get labelRegion => 'Region';

  @override
  String get labelSousRegion => 'Sub-region';

  @override
  String get labelVille => 'City';

  @override
  String get labelChargeParoissial => 'Parish leader';

  @override
  String get labelContact => 'Contact';

  @override
  String get labelSiteWeb => 'Website';

  @override
  String get labelFeteParoisse => 'Parish celebration';

  @override
  String get detailShareItineraireLabel => 'Directions';

  @override
  String get detailShareFooter =>
      'Shared from ilemO, the CCC parish directory.';

  @override
  String get detailGoButton => 'Go — Directions';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmptyMessage =>
      'No favorite parishes yet.\nAdd some from search by tapping the heart.';

  @override
  String get actualitesTitle => 'News';

  @override
  String get actualitesEmptyMessage => 'No news at the moment.';

  @override
  String get actualitesEnSavoirPlus => 'Learn more';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileUserName => 'ilemO User';

  @override
  String get profileConnexionNotice => 'Sign-in not required for now';

  @override
  String get profileMesFavoris => 'My favorites';

  @override
  String get profileFavorisNone => 'No parish saved';

  @override
  String profileFavorisCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# parishes saved',
      one: '# parish saved',
    );
    return '$_temp0';
  }

  @override
  String get profileLangue => 'Language';

  @override
  String get profileChooseLangueTitle => 'Choose language';

  @override
  String get profileAPropos => 'About ilemO';

  @override
  String get profileVersionSubtitle => 'Version 1.0.0 — Benin';

  @override
  String get profilePartagerApp => 'Share the app';

  @override
  String get profilePartagerAppSubtitle => 'Tell others about ilemO';

  @override
  String get profileShareText =>
      'Discover ilemO, the app that centralizes Celestial Church of Christ parishes in Benin!';

  @override
  String get profileAide => 'Help';

  @override
  String get profileAideSubtitle => 'How to use the app';

  @override
  String get profilePrivacy => 'Privacy policy';

  @override
  String get profilePrivacySubtitle => 'How your data is handled';

  @override
  String get profileModeSombre => 'Dark mode';

  @override
  String get profileCreerCompte => 'Create an account';

  @override
  String get profileBientotDisponible => 'Coming soon';

  @override
  String get aboutDialogDescription =>
      'App centralizing Celestial Church of Christ parishes.';

  @override
  String get aboutDialogRole => 'Fullstack Web & Mobile Developer';

  @override
  String get aboutDialogClose => 'Close';

  @override
  String get aboutDialogCredits => 'Design and development:';

  @override
  String get aideTitle => 'Help';

  @override
  String get aideAccueilTitle => 'Home';

  @override
  String get aideAccueilDesc =>
      'The Home screen shows the Celestial Church of Christ emblem, a live count of listed parishes, and an intro carousel. You\'ll also find a \"Celebrating this month\" card highlighting parishes with a celebration this month, plus a preview of the latest news.';

  @override
  String get aideListeTitle => 'Search — List';

  @override
  String get aideListeDesc =>
      'Browse all registered parishes, filter by country, and search by name, city, region or sub-region to quickly find a specific parish.';

  @override
  String get aideAutourDeMoiTitle => 'Search — Nearby';

  @override
  String get aideAutourDeMoiDesc =>
      'By enabling your location, this tab ranks parishes from nearest to farthest. Your location is only used once, on your device, and is never sent or stored on our servers.';

  @override
  String get aideEnFeteTitle => 'Search — Celebrating';

  @override
  String get aideEnFeteDesc =>
      'Find here all parishes celebrating this month, sorted by celebration day.';

  @override
  String get aideDetailTitle => 'Parish details';

  @override
  String get aideDetailDesc =>
      'Selecting a parish opens its full record: parish leader, contact, city, region, website if available, Google Maps link, and celebration date.';

  @override
  String get aideFavorisTitle => 'Favorites';

  @override
  String get aideFavorisDesc =>
      'Tap the heart on a parish to add it to your favorites and find it quickly from the dedicated tab. Your favorites are kept only on your device.';

  @override
  String get aideActualitesTitle => 'News';

  @override
  String get aideActualitesDesc =>
      'Check out the latest published news, with a \"Learn more\" link for each item when available.';

  @override
  String get aideModeSombreTitle => 'Dark mode';

  @override
  String get aideModeSombreDesc =>
      'From your profile, you can switch between light and dark theme as you prefer. This choice is remembered on your device.';

  @override
  String get aideProfilTitle => 'Profile';

  @override
  String get aideProfilDesc =>
      'Find your favorites, the app\'s \"About\" information, the option to share it, the dark mode setting, plus help and the privacy policy.';

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String privacyLastUpdated(String date) {
    return 'Last updated: $date';
  }

  @override
  String get privacySection1Title => '1. Who we are';

  @override
  String get privacySection1Body =>
      'ilemO is an independent app created to centralize information about Celestial Church of Christ (CCC) parishes in Benin, with the aim of expanding to other African countries. It is developed and maintained by an independent developer, outside any official administrative structure of the CCC.';

  @override
  String get privacySection2Title => '2. Data we collect';

  @override
  String get privacySection2Body =>
      'ilemO is designed to work with as little personal data as possible:\n\n• Location: used only occasionally and locally on your device, to find the parishes closest to you (\"Nearby\" feature). This location is never sent to or stored on our servers.\n\n• Favorites: parishes you mark as favorites are saved only on your device (local storage), and are never transmitted or shared.\n\n• Display preference: your choice of light or dark theme is also stored locally on your device.';

  @override
  String get privacySection3Title => '3. What we do not collect (for now)';

  @override
  String get privacySection3Body =>
      'As of today, ilemO does not create a user account, does not ask for your name, email, or phone number, and does not send any push notifications. No identifiable personal data is therefore collected by the app in its current version.';

  @override
  String get privacySection4Title => '4. Third-party services used';

  @override
  String get privacySection4Body =>
      'Parish information (name, region, contact, GPS coordinates, etc.) is hosted on Firebase / Google Cloud (Google LLC), which applies its own security and privacy rules. The location and directions feature may rely on Google Maps. These third-party services may, under their own policies, process certain technical data (IP address, device type) necessary for their operation.';

  @override
  String get privacySection5Title => '5. Your rights';

  @override
  String get privacySection5Body =>
      'Under Benin\'s law No. 2017-20 of April 20, 2018 on the Digital Code of the Republic of Benin, relating in particular to the protection of personal data, and under the supervision of the Personal Data Protection Authority (APDP), everyone has a right to access, correct, and delete data concerning them. Since ilemO does not currently collect any identifiable personal data on its servers, exercising these rights mainly applies to data stored locally on your device, which you can delete at any time via the app settings or by uninstalling the app.';

  @override
  String get privacySection6Title => '6. Future changes to this policy';

  @override
  String get privacySection6Body =>
      'If new features were to require creating an account, sending notifications, or any other collection of personal data, this privacy policy will be updated beforehand, and the new version will be made available in the app and on this page.';

  @override
  String get privacySection7Title => '7. Children';

  @override
  String get privacySection7Body =>
      'ilemO is not intended for targeted use by children and does not knowingly collect any personal data about minors.';

  @override
  String get privacySection8Title => '8. Contact';

  @override
  String get privacySection8Body =>
      'For any questions regarding this privacy policy or the ilemO app, you can contact us via the contact information available in the app\'s \"About\" section.';
}
