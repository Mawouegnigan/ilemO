import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Écran d'aide : explique chaque fonctionnalité de l'application via
/// une liste de sections dépliables (ExpansionTile).
class AideScreen extends StatelessWidget {
  const AideScreen({super.key});

  static const List<_AideItem> _items = [
    _AideItem(
      icon: Icons.home_outlined,
      title: 'Accueil',
      description:
          "L'écran d'accueil affiche l'emblème de l'Église du "
          "Christianisme Céleste, un aperçu en direct du nombre de "
          "paroisses référencées, ainsi qu'un carrousel de présentation. "
          "Vous y retrouvez aussi une carte \"En fête ce mois\" qui met en "
          "avant les paroisses célébrant leur fête ce mois-ci, et un "
          "aperçu des dernières actualités.",
    ),
    _AideItem(
      icon: Icons.list_alt_outlined,
      title: 'Recherche — Liste',
      description:
          "Parcourez l'ensemble des paroisses enregistrées, filtrez par "
          "pays et effectuez une recherche par nom, ville, région ou "
          "sous-région pour retrouver rapidement une paroisse précise.",
    ),
    _AideItem(
      icon: Icons.near_me_outlined,
      title: 'Recherche — Autour de moi',
      description:
          "En activant votre position, cet onglet classe les paroisses de "
          "la plus proche à la plus éloignée de vous. Votre position n'est "
          "utilisée que ponctuellement, sur votre appareil, et n'est "
          "jamais envoyée ni stockée sur nos serveurs.",
    ),
    _AideItem(
      icon: Icons.celebration_outlined,
      title: 'Recherche — En fête',
      description:
          "Retrouvez ici toutes les paroisses qui célèbrent leur fête au "
          "cours du mois en cours, classées par jour de célébration.",
    ),
    _AideItem(
      icon: Icons.church_outlined,
      title: 'Détail d\'une paroisse',
      description:
          "En sélectionnant une paroisse, vous accédez à sa fiche "
          "complète : chargé paroissial, contact, ville, région, site web "
          "s'il existe, lien vers Google Maps, et date de fête.",
    ),
    _AideItem(
      icon: Icons.favorite_border,
      title: 'Favoris',
      description:
          "Appuyez sur le cœur d'une paroisse pour l'ajouter à vos "
          "favoris et la retrouver rapidement depuis l'onglet dédié. Vos "
          "favoris sont conservés uniquement sur votre appareil.",
    ),
    _AideItem(
      icon: Icons.newspaper_outlined,
      title: 'Actualités',
      description:
          "Consultez les dernières actualités publiées, avec la "
          "possibilité d'accéder à un lien \"En savoir plus\" pour chaque "
          "actualité lorsqu'il est disponible.",
    ),
    _AideItem(
      icon: Icons.dark_mode_outlined,
      title: 'Mode sombre',
      description:
          "Depuis votre profil, vous pouvez basculer entre le thème clair "
          "et le thème sombre selon votre préférence. Ce choix est "
          "mémorisé sur votre appareil.",
    ),
    _AideItem(
      icon: Icons.person_outline,
      title: 'Profil',
      description:
          "Retrouvez vos favoris, les informations \"À propos\" de "
          "l'application, la possibilité de la partager, le réglage du "
          "mode sombre, ainsi que l'aide et la politique de "
          "confidentialité.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorBackground,
      appBar: AppBar(
        backgroundColor: context.colorSurface,
        elevation: 0,
        title: Text(
          'Aide',
          style: TextStyle(
            color: context.colorTextPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(color: context.colorTextPrimary),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        itemCount: _items.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: context.colorBorder,
        ),
        itemBuilder: (context, index) {
          final item = _items[index];
          return Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: Icon(item.icon, color: context.colorPrimary),
              title: Text(
                item.title,
                style: TextStyle(
                  color: context.colorTextPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              iconColor: context.colorPrimary,
              collapsedIconColor: context.colorTextSecondary,
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.description,
                  style: TextStyle(
                    color: context.colorTextSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AideItem {
  final IconData icon;
  final String title;
  final String description;

  const _AideItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}