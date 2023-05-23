import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stress_alarm/firebase_options.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'util/color.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stress Alarm',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(Palette.white),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
