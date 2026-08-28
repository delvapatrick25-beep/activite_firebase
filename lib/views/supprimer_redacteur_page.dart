import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';

class SupprimerRedacteurPage extends StatelessWidget {
  final Redacteur redacteur;
  final RedacteurController controller;

  const SupprimerRedacteurPage({
    super.key,
    required this.redacteur,
    required this.controller,
  });

  Future<void> _supprimerRedacteur(BuildContext context) async {
    try {
      await controller.supprimerRedacteur(redacteur.id);
      if (context.mounted) _afficherSuccesDialog(context);
    } catch (_) {
      if (context.mounted) _afficherErreurDialog(context);
    }
  }

  void _afficherSuccesDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Succès'),
        content: const Text('Le rédacteur a été supprimé avec succès.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((_) {
      if (context.mounted) Navigator.pop(context);
    });
  }

  void _afficherErreurDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Erreur'),
        content:
            const Text('Une erreur est survenue lors de la suppression.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supprimer un Rédacteur'),
        backgroundColor: const Color.fromARGB(255, 219, 24, 144),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Voulez-vous vraiment supprimer le rédacteur '
              '« ${redacteur.nom} » ?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Spécialité : ${redacteur.specialite}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _supprimerRedacteur(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Supprimer le rédacteur'),
            ),
          ],
        ),
      ),
    );
  }
}