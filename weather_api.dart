import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  static const String routeName = '/weather';

  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String apiKey = '6fdbfb3be236fd19b5f4fb9fa956c236'; // OpenWeather API key
  String city = ''; // city name
  String temperature = ''; // derece
  String description = ''; // detay

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  // kullanıcının bulunduğu konumu almak için fonksiyon
  Future<String> getCurrentLocation() async {
    // Konum verilerini almak için kullanılan servis URL'i
    final url = Uri.parse('http://ip-api.com/json/?fields=city');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['city'];
    } else {
      throw Exception('Failed to get current location');
    }
  }

  // OpenWeather kullanarak hava durumu verilerini almak için fonksiyon
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

  // kullanıcının bulunduğu veya girdiği şehre göre hava durumunu almak için fonksiyon
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'City: $city',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Temperature: $temperature°C',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description: $description',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
