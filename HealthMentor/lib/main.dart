import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/homePage.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/menuPage.dart';
import 'screens/examprep.dart';
import 'screens/nutrition.dart';
import 'screens/fitness.dart';
import 'screens/stress.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrepPal',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 60, 4, 115),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/menu': (context) => MenuPage(),
        '/exam': (context) => ExamPrep(),
        '/nutrition': (context) => Nutrition(),
        '/fitness': (context) => Fitness(),
        '/stress': (context) => Stress(),
      },
    );
  }
}
