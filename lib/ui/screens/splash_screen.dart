import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Dance(
            child: const Text(
              'Example App Splash',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
