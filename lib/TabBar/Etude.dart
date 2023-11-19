import 'package:flutter/material.dart';

class Etude extends StatelessWidget {
  const Etude({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text(
          "second Tab",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
