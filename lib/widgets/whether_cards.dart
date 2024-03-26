import 'package:flutter/material.dart';

class WhetherCards extends StatelessWidget {
  const WhetherCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 150,
      child: const Card(
        elevation: 3,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Today 30°C',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'monospace',
                fontWeight: FontWeight.w300,
              ),
            ),
            Icon(
              Icons.cloud,
              size: 60,
            ),
            Text(
              '301.17',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
