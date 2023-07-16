import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/app_hanife/lib/services/provider/auth_provider.dart';
import '../../services/provider/auth_provider.dart';
import 'locator.dart';
import 'screens/login_screen/login_screen.dart';
import 'utils/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //once uygulamayi baslatir
  await Firebase.initializeApp();
  setupLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => locator.get<AuthProvider>(),)
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
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