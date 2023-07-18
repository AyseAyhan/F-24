
import 'dart:convert';
import 'package:achievoapp/screens/profile/profile.dart';
import 'package:achievoapp/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';
import '../../services/provider/auth_provider.dart';
import '../../utils/preferences.dart';
import 'screens/login_screen/login_screen.dart';
import 'utils/constants.dart';
import 'package:http/http.dart' as http;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => locator.get<AuthProvider>(),
        ),
      ],
      child: const ProfileScreen(),
    ),
  );
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  static const String title = 'Profil';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  bool isDarkModeEnabled = false;

  void toggleDarkMode() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  void goToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  String apiKey = '6fdbfb3be236fd19b5f4fb9fa956c236';
  String city = '';
  String temperature = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  Future<String> getCurrentLocation() async {
    final url = Uri.parse('http://ip-api.com/json/?fields=city');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['city'];
    } else {
      throw Exception('Failed to get current location');
    }
  }

  Future<void> getWeatherData(String cityName) async {
    final url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        temperature = jsonData['main']['temp'].toString();
        description = jsonData['weather'][0]['description'];
      });
    } else {
      throw Exception('Failed to get weather data');
    }
  }

  Future<void> getLocationWeather() async {
    try {
      final currentLocation = await getCurrentLocation();
      setState(() {
        city = currentLocation;
      });
      await getWeatherData(city);
    } catch (e) {
      print(e);
    }
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
          backgroundColor: kSecondaryColor,
        ),
      ),
      title: ProfileScreen.title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(ProfileScreen.title),
          leading: GestureDetector(
          child: Icon( Icons.arrow_back, color: Colors.white,),
          onTap: () {
            Navigator.pop(context);
          } ,
        ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'profile') {
                  goToProfilePage();
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'profile',
                  child: Text('Profile'),
                ),
              ],
            ),
            IconButton(
              icon: Icon(isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => toggleDarkMode(),
            ),
          ],
        ),
        body: FutureBuilder(
          future: UserPreferences.init(), // UserPreferences'ın başlatılmasını bekleyin
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Yükleniyor durumunda bir gösterge veya animasyon gösterin
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Hata durumunda bir hata mesajı gösterin
              return Center(child: Text('Hata: ${snapshot.error}'));
            } else {
              // Başarılı başlatma durumunda profil sayfasını gösterin
              return const ProfilePage();
            }
          },
        ),
      ),
    );
  }
}