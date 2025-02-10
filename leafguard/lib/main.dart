import 'package:flutter/material.dart';
import 'package:leafguard/auth/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green, const Color.fromARGB(255, 152, 175, 125)
            ])
          ),
          child: IntroductionScreen(),
        ),
      )
    );
  }
}