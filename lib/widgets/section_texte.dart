import 'package:flutter/material.dart';

class SectionTexte extends StatelessWidget {
  const SectionTexte({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Text(
        'Magazine Infos est bien plus qu\'un simple magazine d\'informations. '
        'C\'est votre passerelle vers le monde, une source inestimable de '
        'connaissances et d\'actualités soigneusement sélectionnées pour vous '
        'éclairer sur les enjeux mondiaux, la culture, la science, la tech, '
        'et voir même le divertissement (le jeu).',
        style: TextStyle(fontSize: 14, height: 1.5),
      ),
    );
  }
}