# Guide — Héberger la politique de confidentialité sur Firebase Hosting

Google Play (et l'App Store) exigent une **URL publique** pour la politique de
confidentialité. Firebase Hosting est le choix le plus simple puisque tu as
déjà le projet `ilemo-app` et le Firebase CLI installés.

## 1. Préparer le dossier

Le fichier `index.html` fourni dans `privacy_policy_hosting/` est autonome
(aucune dépendance externe). Place-le tel quel dans un nouveau dossier dédié
à l'intérieur de ton projet Flutter, par exemple :

```
ilemo/
  hosting/
    privacy/
      index.html
```

(Tu peux copier-coller le fichier `privacy_policy_hosting/index.html` livré
ici vers `ilemo/hosting/privacy/index.html`.)

## 2. Initialiser Firebase Hosting (si pas déjà fait)

Depuis la racine du projet Flutter, dans PowerShell :

```powershell
firebase init hosting
```

Réponds aux questions ainsi :
- **Which Firebase project** → sélectionner `ilemo-app`
- **What do you want to use as your public directory** → `hosting`
- **Configure as a single-page app** → `No`
- **Set up automatic builds and deploys with GitHub** → `No` (sauf si tu veux du CI/CD)
- **File hosting/index.html already exists. Overwrite?** → `No` (pour ne pas écraser `privacy/index.html`)

Cela crée un fichier `firebase.json` à la racine, ressemblant à :

```json
{
  "hosting": {
    "public": "hosting",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"]
  }
}
```

## 3. Déployer

```powershell
firebase deploy --only hosting
```

À la fin du déploiement, Firebase te donne une URL du type :

```
https://ilemo-app.web.app
```

La page de politique de confidentialité sera alors accessible à :

```
https://ilemo-app.web.app/privacy/index.html
```

## 4. (Optionnel) Simplifier l'URL

Si tu préfères une URL plus courte comme `https://ilemo-app.web.app/privacy`,
ajoute une réécriture dans `firebase.json` :

```json
{
  "hosting": {
    "public": "hosting",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "/privacy",
        "destination": "/privacy/index.html"
      }
    ]
  }
}
```

Puis redéploie : `firebase deploy --only hosting`.

## 5. Utiliser l'URL

Une fois en ligne, utilise cette URL publique :
- Dans la fiche Google Play Console (section "Politique de confidentialité").
- Dans la fiche App Store Connect si une version iOS est publiée un jour.
- Éventuellement en lien depuis l'écran `privacy_policy_screen.dart` de
  l'application, si tu veux un bouton "Voir en ligne".

## 6. Mise à jour du contenu

Si tu modifies le contenu de `privacy_policy_screen.dart` dans l'app, pense à
répercuter le même changement dans `hosting/privacy/index.html` puis à
relancer `firebase deploy --only hosting`, afin que les deux versions restent
identiques (c'est une exigence implicite des stores).