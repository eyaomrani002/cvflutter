import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your SplashScreen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        // Your app's theme
      ),
      home: SplashScreen(), // Set SplashScreen as the home screen

    );

  }
}
