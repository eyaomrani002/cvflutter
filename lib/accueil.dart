import 'package:flutter/material.dart';
import'package:ayaomrani/TabBar/TabBar.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the MyTabBar screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyTabBar()),
            );
          },
          child: Text("Open Tab Bar"),
        ),
      ),
    );
  }
}