import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app2/widgets/whether_cards.dart';

class WhetherPage extends StatelessWidget {
  const WhetherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Whether App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              print('Refresh Button Pressed');
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          // this is for the whether icon card
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Card(
              elevation: 3,
              child: Column(
                children: [
                  Text(
                    'Today 30°C',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(
                    Icons.cloud,
                    size: 100,
                  ),
                  Text(
                    'Sunny',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Whether Forcast',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhetherCards(),
                WhetherCards(),
                WhetherCards(),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          const Placeholder(
            fallbackHeight: 200,
          ),
        ],
      ),
    );
  }
}
