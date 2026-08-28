import 'package:flutter/material.dart';

class SectionIcone extends StatelessWidget {
  const SectionIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconGroup(Icons.phone, 'TEL'),
          _buildIconGroup(Icons.mail, 'MAIL'),
          _buildIconGroup(Icons.share, 'PARTAGE'),
        ],
      ),
    );
  }

  Widget _buildIconGroup(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: const Color.fromARGB(255, 219, 24, 144), size: 30),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 219, 24, 144),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}