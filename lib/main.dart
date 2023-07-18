import 'package:achievoapp/utils/preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/provider/auth_provider.dart';
import 'locator.dart';
import 'screens/login_screen/login_screen.dart';
import 'utils/constants.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); //once uygulamayi baslatir
  await Firebase.initializeApp(); //firebasebaglantisi kurulur
  setupLocator();
  //await UserPreferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => locator.get<AuthProvider>(),)
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget 
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      title: 'Achievo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryColor,
              fontFamily: 'Montserrat',
            ),
      ),
      home: const LoginScreen(),
    );
  }
}


