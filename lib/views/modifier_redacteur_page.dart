// Fichier : lib/views/modifier_redacteur_page.dart
//
// VIEW — Classe ModifierRedacteurPage (StatefulWidget).
// TODO(étudiant) : implémenter la page de modification d'un rédacteur.
//
// - Reçoit un objet Redacteur et un RedacteurController en paramètres ;
// - initState() : préremplir _nomController et _specialiteController avec les
//   données actuelles du rédacteur ;
// - Bouton d'enregistrement appelant controller.modifierRedacteur(
//     widget.redacteur.id, _nomController.text.trim(), _specialiteController.text.trim()) ;
// - AlertDialog de confirmation après modification réussie ;
// - dispose() : libérer les contrôleurs.