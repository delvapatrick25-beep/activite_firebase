import 'package:flutter/material.dart';

class SectionService extends StatelessWidget {
  const SectionService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage('assets/images/rubrique1.jpg'),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage('assets/images/rubrique2.jpg'),
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}