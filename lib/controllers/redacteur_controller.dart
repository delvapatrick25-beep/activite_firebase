// Fichier : lib/controllers/redacteur_controller.dart
//
// CONTROLLER — Classe RedacteurController.
// TODO(étudiant) : implémenter le contrôleur centralisant l'accès à Firestore.
//
// - Attribut : final FirebaseFirestore _firestore = FirebaseFirestore.instance ;
// - Getter : Stream<QuerySnapshot> get redacteursStream (écoute temps réel
//   de la collection 'redacteurs') ;
// - Future<void> ajouterRedacteur(String nom, String specialite)  -> Create ;
// - Future<void> modifierRedacteur(String id, String nom, String specialite) -> Update ;
// - Future<void> supprimerRedacteur(String id)                     -> Delete.
//
// Règle MVC : toutes les opérations Firebase passent par cette classe,
// jamais directement depuis les vues.