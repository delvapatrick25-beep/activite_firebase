import 'package:flutter/material.dart';

import '../controllers/redacteur_controller.dart';
import '../widgets/section_icone.dart';
import '../widgets/section_service.dart';
import '../widgets/section_texte.dart';
import '../widgets/section_titre.dart';
import 'ajout_redacteur_page.dart';
import 'redacteur_info_page.dart';

class PageAccueil extends StatelessWidget {
  final RedacteurController controller = RedacteurController();

  PageAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magazine Infos',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 219, 24, 144),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 219, 24, 144)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Magazine Infos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Gestion des rédacteurs',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_add,
                color: Color.fromARGB(255, 219, 24, 144),
              ),
              title: const Text('Ajouter un Rédacteur'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AjoutRedacteurPage(controller: controller),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: Color.fromARGB(255, 219, 24, 144),
              ),
              title: const Text('Informations des Rédacteurs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RedacteurInfoPage(controller: controller),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/magazineInfo.jpg')),
            const SectionTitre(),
            const SectionTexte(),
            const SectionIcone(),
            const SectionService(),
          ],
        ),
      ),
    );
  }
}