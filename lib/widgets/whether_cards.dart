import 'package:flutter/material.dart';

class WhetherCards extends StatelessWidget {
  final IconData icon;
  final String title;
  final int temp;
  const WhetherCards(
      {super.key, required this.icon, required this.title, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 150,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w300,
              ),
            ),
            Icon(
              icon,
              size: 60,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '$temp°F',
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
