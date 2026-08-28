// Fichier : lib/views/redacteur_info_page.dart
//
// VIEW — Classe RedacteurInfoPage (affichage de la liste des rédacteurs).
// TODO(étudiant) : implémenter la page de consultation des rédacteurs.
//
// - Reçoit un RedacteurController en paramètre (injection de dépendance) ;
// - StreamBuilder<QuerySnapshot> sur controller.redacteursStream ;
// - Indicateur de chargement pendant la lecture ;
// - Message "Aucun rédacteur trouvé." si la collection est vide ;
// - ListView.builder avec une Card par rédacteur (nom + spécialité) ;
// - Icônes Modifier et Supprimer par rédacteur (navigation vers les pages
//   ModifierRedacteurPage et SupprimerRedacteurPage).
//
// Règle MVC : la vue n'accède jamais à FirebaseFirestore directement.