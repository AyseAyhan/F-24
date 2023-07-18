/*import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      body: Center(
        child: Text("Anasayfa"),
      ),
    );
  }
}*/
import 'package:achievoapp/screens/agenda/agenda.dart';
import 'package:achievoapp/screens/profile/profile.dart';
import 'package:achievoapp/screens/profile/profile_edit.dart';
import 'package:achievoapp/screens/settings/settings.dart';
import 'package:achievoapp/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../services/apis/weather_api.dart';
import 'Goals/widget_page/Goal Setting Page.dart';
import 'Goals/widget_page/Spor.dart';
import 'Goals/widget_page/goal1page.dart';
/*import 'package:untitled6/app/Goals/Repository%20of%20the%20Goals%20List.dart';
*/
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(title: '',),
      routes: {
        WeatherPage.routeName: (context) => const WeatherPage(),
        //HealthTipsPage.routeName: (context) => const HealthTipsPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  //String motivationQuote = '';
  int _counter = 0;

  TextEditingController? get Goal => null;

  get newValue => null;

  get Value => null;

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    //getMotivationQuote();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kSecondaryColor,
        title: Text('Achievo App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: ListTile(
                  leading: Icon(Icons.person, color: kSecondaryColor,),
                  title: const Text('Profil', style: TextStyle(fontSize: 20, color: kSecondaryColor,),),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) {
                              return ProfileScreen();
                            }
                        )
                    );
                  }
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_month, color: kSecondaryColor,),
                title: const Text('Ajanda',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return AnaEkran();
                          }
                      )
                  );
                }
            ),
            ListTile(
              leading: Icon(Icons.done_outline_sharp, color: kSecondaryColor,),
                title: const Text('Hedefler',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return GoalScreen();
                          }
                      )
                  );
                }
            ),
            ListTile(
              leading: Icon(Icons.sports_gymnastics, color: kSecondaryColor,),
                title: const Text('Spor',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push<String>(
                      MaterialPageRoute(
                          builder: (context) {
                            return SportScreen();
                          }
                      )
                  );
                }
            ),
            ListTile(
              leading: Icon(Icons.dinner_dining,color: kSecondaryColor,),
                title: const Text('Diyet',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push<String>(
                      MaterialPageRoute(
                          builder: (context) {
                            return AnaEkran();
                          }
                      )
                  );
                }
            ),
            ListTile(
              leading: Icon(Icons.settings, color: kSecondaryColor,),
                title: const Text('Ayarlar',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push<String>(
                      MaterialPageRoute(
                          builder: (context) {
                            return SettingsPage();
                          }
                      )
                  );
                }
            ),
            ListTile(
                leading: Icon(Icons.logout,color: kSecondaryColor,),
                title: const Text('Çıkış Yap',style: TextStyle(fontSize: 20, color: kSecondaryColor),),
                onTap: () {
                  Navigator.of(context).push<String>(
                      MaterialPageRoute(
                          builder: (context) {
                            return SportScreen();
                          }
                      )
                  );
                }
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: const Text('Hava Durumu'),
              onTap: () {
                Navigator.pushNamed(context, WeatherPage.routeName);
              },
            ),
            const Text(
              'Hedef Sayısı:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          _incrementCounter();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context){
                return goalSettingPage(title:'',);
              },
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}