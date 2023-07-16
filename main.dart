import 'package:flutter/material.dart';
import 'package:weather_api/pages/health_api.dart';
import 'package:weather_api/pages/motivation_api.dart';
import 'package:weather_api/pages/weather_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        WeatherPage.routeName: (context) => const WeatherPage(),
        HealthTipsPage.routeName: (context) => const HealthTipsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String motivationQuote = '';

  @override
  void initState() {
    super.initState();
    getMotivationQuote();
  }

  Future<String> getMotivationQuote() async {
    final quote = await MotivationApi.getMotivationQuote();
    setState(() {
      motivationQuote = quote;
    });
    return quote;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Weather Page'),
              onTap: () {
                Navigator.pushNamed(context, WeatherPage.routeName);
              },
            ),
            ListTile(
              title: const Text('Health Tips'),
              onTap: () {
                Navigator.pushNamed(context, HealthTipsPage.routeName);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            FutureBuilder<String>(
              future: getMotivationQuote(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    'Failed to fetch a motivation quote.',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
