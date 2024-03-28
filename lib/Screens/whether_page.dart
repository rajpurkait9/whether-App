import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app2/secrets.dart';
import 'package:my_app2/widgets/whether_cards.dart';
import 'package:http/http.dart' as http;

class WhetherPage extends StatefulWidget {
  const WhetherPage({super.key});

  @override
  State<WhetherPage> createState() => _WhetherPageState();
}

class _WhetherPageState extends State<WhetherPage> {
  late double temp = 0;
  @override
  void initState() {
    super.initState();
    getWhetherData();
  }

  Future getWhetherData() async {
    try {
      const String whetherApiKey = OpenWhetherApi;
      String cityName = 'Delhi';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$whetherApiKey'),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);

        setState(() {
          temp = data['list'][0]['main']['temp'];
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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
              getWhetherData();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: temp == 0
          ? const Center(child: CircularProgressIndicator())
          : Column(
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
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Text(
                          'Today ${temp.toString()}°K',
                          style: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(
                          Icons.cloud,
                          size: 100,
                        ),
                        const Text(
                          'Sunny',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
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
                      WhetherCards(
                        icon: Icons.sunny,
                        title: 'sunny',
                        temp: 30,
                      ),
                      WhetherCards(
                        icon: Icons.water,
                        title: 'Cloudy',
                        temp: 30,
                      ),
                      WhetherCards(
                        icon: Icons.cloud,
                        title: 'Cloudy',
                        temp: 30,
                      ),
                      WhetherCards(
                        icon: Icons.cloud,
                        title: 'Cloudy',
                        temp: 30,
                      ),
                      WhetherCards(
                        icon: Icons.cloud,
                        title: 'Cloudy',
                        temp: 30,
                      ),
                      WhetherCards(
                        icon: Icons.cloud,
                        title: 'Cloudy',
                        temp: 30,
                      ),
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
