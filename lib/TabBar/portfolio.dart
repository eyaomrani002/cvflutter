import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
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




