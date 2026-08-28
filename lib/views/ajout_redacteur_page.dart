// Fichier : lib/views/ajout_redacteur_page.dart
//
// VIEW — Classe AjoutRedacteurPage (StatefulWidget).
// TODO(étudiant) : implémenter le formulaire d'ajout d'un rédacteur.
//
// - Reçoit un RedacteurController en paramètre ;
// - Attributs : _formKey (GlobalKey<FormState>), _nomController,
//   _specialiteController (TextEditingController), style du bouton ;
// - Form avec deux TextFormField avec validation (champs non vides) ;
// - Bouton d'ajout appelant widget.controller.ajouterRedacteur(
//     _nomController.text.trim(), _specialiteController.text.trim()) ;
// - Boîte de dialogue de succès après l'ajout ;
// - dispose() : libérer les contrôleurs.