import 'package:flutter/material.dart';

class Competence extends StatelessWidget {
  const Competence({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
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
