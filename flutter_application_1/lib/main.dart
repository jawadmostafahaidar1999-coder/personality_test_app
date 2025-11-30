import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personality Test',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 15, 88, 112),
        fontFamily: 'Lato',
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const Quiz(),
    );
  }
}
