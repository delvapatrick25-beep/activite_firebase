import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../models/redacteur.dart';
import 'modifier_redacteur_page.dart';
import 'supprimer_redacteur_page.dart';

class RedacteurInfoPage extends StatelessWidget {
  final RedacteurController controller;

  const RedacteurInfoPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations des Rédacteurs'),
        backgroundColor: const Color.fromARGB(255, 219, 24, 144),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.redacteursStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Une erreur est survenue lors du chargement.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Aucun rédacteur trouvé.'),
            );
          }

          final redacteurs = snapshot.data!.docs
              .map((doc) => Redacteur.fromFirestore(doc))
              .toList();

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: redacteurs.length,
            itemBuilder: (context, index) {
              final redacteur = redacteurs[index];
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 219, 24, 144),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    redacteur.nom,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(redacteur.specialite),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModifierRedacteurPage(
                                redacteur: redacteur,
                                controller: controller,
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SupprimerRedacteurPage(
                                redacteur: redacteur,
                                controller: controller,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}