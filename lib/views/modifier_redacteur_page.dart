import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';

class ModifierRedacteurPage extends StatefulWidget {
  final Redacteur redacteur;
  final RedacteurController controller;

  const ModifierRedacteurPage({
    super.key,
    required this.redacteur,
    required this.controller,
  });

  @override
  State<ModifierRedacteurPage> createState() => _ModifierRedacteurPageState();
}

class _ModifierRedacteurPageState extends State<ModifierRedacteurPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nomController;
  late final TextEditingController _specialiteController;
  late final ButtonStyle _styleBouton;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.redacteur.nom);
    _specialiteController =
        TextEditingController(text: widget.redacteur.specialite);
    _styleBouton = ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 219, 24, 144),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  Future<void> _enregistrerModifications() async {
    if (_formKey.currentState!.validate()) {
      try {
        await widget.controller.modifierRedacteur(
          widget.redacteur.id,
          _nomController.text.trim(),
          _specialiteController.text.trim(),
        );
        if (mounted) _afficherSuccesDialog();
      } catch (_) {
        if (mounted) _afficherErreurDialog();
      }
    }
  }

  void _afficherSuccesDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Succès'),
        content: const Text('Les modifications ont été enregistrées.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ],
      ),
    ).then((_) {
      if (mounted) Navigator.pop(context);
    });
  }

  void _afficherErreurDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Erreur'),
        content: const Text(
            'Une erreur est survenue lors de la modification du rédacteur.'),
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
  void dispose() {
    _nomController.dispose();
    _specialiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modifier un Rédacteur'),
        backgroundColor: const Color.fromARGB(255, 219, 24, 144),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Entrez le nom du rédacteur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir le nom';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _specialiteController,
                decoration: const InputDecoration(
                  labelText: 'Spécialité',
                  hintText: 'Entrez la spécialité du rédacteur',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez saisir la spécialité';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _enregistrerModifications,
                style: _styleBouton,
                child: const Text('Enregistrer les modifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}