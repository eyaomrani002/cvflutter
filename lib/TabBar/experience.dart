import 'package:flutter/material.dart';

class Experience extends StatelessWidget {
  const Experience({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "Third Tab",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
