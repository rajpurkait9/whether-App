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
                    'Today 300°F',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w600,
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
                WhetherCards(),
                WhetherCards(),
                WhetherCards(),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Additional Information',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 30,
                  ),
                  Text('Humidity '),
                  Text('30%'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.air_outlined,
                    size: 30,
                  ),
                  Text('Wind Speed'),
                  Text('10 km/h'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.umbrella_outlined,
                    size: 30,
                  ),
                  Text('Rain'),
                  Text('0%'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
