import 'package:flutter/material.dart';

import 'package:profile_page/pages/profile.dart';
import 'package:profile_page/utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  static const String title = 'User Profile';

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDarkModeEnabled = false;
  int _counter = 0;
  TextEditingController addGoal = TextEditingController();

  void toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void dispose() {
    addGoal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = isDarkModeEnabled ? Brightness.dark : Brightness.light;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: brightness,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      title: MyApp.title,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => toggleDarkMode(),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('drawer header'),
              ),
              ListTile(
                title: const Text('item 1'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return goal1Page();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Goal Number:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return goalPage();
                },
              ),
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class goalPage extends StatefulWidget {
  const goalPage({Key? key}) : super(key: key);

  @override
  State<goalPage> createState() => _goalPageState();
}

class _goalPageState extends State<goalPage> {
  TextEditingController addGoal = TextEditingController();

  @override
  void dispose() {
    addGoal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('New Goal'),
    ),
    body: Center(
      child: TextField(
        controller: addGoal,
        onChanged: (deger) {
          setState(() {});
        },
      ),
    ),
    );
  }
}

class goal1Page extends StatefulWidget {
  const goal1Page({Key? key}) : super(key: key);

  @override
  State<goal1Page> createState() => _goal1PageState();
}

class _goal1PageState extends State<goal1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Name'),
      ),
      body: Center(
        child: Text(goalPage().addGoal.text),
      ),
    );
  }
}




