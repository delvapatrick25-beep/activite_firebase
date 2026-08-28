# Gestion des rédacteurs pour Magazine Infos

Flutter + Firebase Firestore + Architecture MVC

Activité n°3 — Cours Développement Mobile (Niveau approfondi)

## Objectif

Enrichir l'application mobile **Magazine Infos** (développée au niveau intermédiaire) avec un module de **gestion des rédacteurs** : ajouter, lister, modifier et supprimer des rédacteurs. Les données sont stockées dans **Firebase Firestore** pour une synchronisation en temps réel, et le code respecte une architecture **MVC** (Model – View – Controller).

## Fonctionnalités

| Fonctionnalité | Description |
|----------------|-------------|
| Accueil | Page d'accueil de Magazine Infos : titre, image, description et menu Drawer |
| Ajouter un rédacteur | Formulaire nom + spécialité, enregistrement dans Firestore |
| Lister les rédacteurs | Affichage en temps réel (StreamBuilder) des documents de la collection `redacteurs` |
| Modifier un rédacteur | Formulaire prérempli puis mise à jour Firestore |
| Supprimer un rédacteur | Page de confirmation puis suppression du document |

## Architecture MVC

```
lib/
 ├── main.dart
 ├── models/
 │    └── redacteur.dart
 ├── controllers/
 │    └── redacteur_controller.dart
 ├── views/
 │    ├── page_accueil.dart
 │    ├── ajout_redacteur_page.dart
 │    ├── redacteur_info_page.dart
 │    ├── modifier_redacteur_page.dart
 │    └── supprimer_redacteur_page.dart
 └── widgets/
      ├── section_titre.dart
      ├── section_texte.dart
      ├── section_icone.dart
      └── section_service.dart
```

| Couche | Rôle | Règle à respecter |
|--------|------|--------------------|
| **Model** (`Redacteur`) | Représente les données métier : `id`, `nom`, `specialite` | Aucune interface graphique, aucune logique de navigation |
| **Controller** (`RedacteurController`) | Gère Firestore et expose les méthodes CRUD | Toutes les opérations Firebase passent par cette classe |
| **View** (pages) | Affiche les écrans et récupère les actions utilisateur | Ne manipule jamais `FirebaseFirestore` directement |
| **Widgets** | Composants visuels réutilisables | Favoriser la réutilisation et alléger les pages |

## Prérequis

- Flutter SDK installé et configuré
- Android Studio / VS Code avec émulateur ou appareil Android
- Un compte Firebase

## Mise en place

### 1. Configuration Firebase

1. Créer un projet Firebase (ex. `activitefirebase`) sur la [console Firebase](https://console.firebase.google.com/).
2. Créer une base **Cloud Firestore**.
3. Créer la collection `redacteurs` avec les champs suivants par document :
   - `nom` : `String`
   - `specialite` : `String`
   - L'identifiant du document Firestore sert d'`id`.
4. Pendant le développement, utiliser des règles de test uniquement (le formateur autorise ce choix) ; ne pas les conserver pour une application publiée.

### 2. Ajout de Firebase au projet Android

1. Dans la console Firebase, ajouter une application **Android** au projet.
2. Récupérer l'identifiant Android du projet Flutter dans `android/app/build.gradle.kts` :
   ```kotlin
   applicationId = "com.example.activite_firebase"
   ```
3. Télécharger le fichier **`google-services.json`**.
4. Le placer dans le dossier `android/app/`.
5. Activer le plugin Google Services (le projet utilise **Kotlin DSL**).

Dans `android/settings.gradle.kts`, ajouter dans le bloc `plugins` :
```kotlin
id("com.google.gms.google-services") version "4.4.2" apply false
```

Dans `android/app/build.gradle.kts`, ajouter dans le bloc `plugins` :
```kotlin
id("com.google.gms.google-services")
```

### 3. Dépendances dans `pubspec.yaml`

Ajouter les dépendances suivantes puis exécuter `flutter pub get` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.0.0
  cloud_firestore: ^5.0.0
```

### 4. Initialisation Firebase dans `main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonApplication());
}
```

## Opérations CRUD (RedacteurController)

| Méthode | Type CRUD | Rôle |
|---------|-----------|------|
| `ajouterRedacteur(nom, specialite)` | Create | Ajoute un nouveau document dans `redacteurs` |
| `redacteursStream` | Read | Écoute en temps réel les documents de la collection |
| `modifierRedacteur(id, nom, specialite)` | Update | Met à jour `nom` et `specialite` du document ciblé |
| `supprimerRedacteur(id)` | Delete | Supprime le document correspondant à l'identifiant |

## Bonnes pratiques

- Valider les champs avec `GlobalKey<FormState>`, `TextFormField` et `TextEditingController` ; libérer les contrôleurs dans `dispose()`.
- Nettoyer les chaînes avec `trim()` avant envoi.
- Afficher un indicateur de chargement pendant la lecture Firestore.
- Gérer les erreurs Firestore avec `try/catch` autour des appels asynchrones.
- Aucune requête Firestore directement dans les vues.

## Livrables

- Projet Flutter complet (dossier propre, sans `build/`).
- Captures d'écran : accueil, formulaire d'ajout, liste des rédacteurs, modification, suppression, Firestore.
- Rapport court : architecture MVC, configuration Firebase, explication des opérations CRUD, difficultés rencontrées.
- Démonstration sur émulateur ou appareil Android.

Nom du fichier compressé attendu : `NOM_Prénom_S3_Firebase_MVC.zip`