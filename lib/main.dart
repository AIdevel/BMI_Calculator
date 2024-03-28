import 'package:flutter/material.dart';
import 'screens/inputpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            backgroundColor: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: const InputPage(),
    );
  }
}
