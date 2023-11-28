import 'package:ayaomrani/components/timeline_title.dart';
import 'package:flutter/material.dart';

import '../Map.dart';

class Etude extends StatefulWidget {
  const Etude({Key? key}) : super(key: key);

  @override
  State<Etude> createState() => _EtudeState();
}

class _EtudeState extends State<Etude> {
  bool isDarkMode = false;
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        shadowColor: isDarkMode ? Colors.white : Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              color: isDarkMode ? Colors.white : Colors.black,
              icon: isDarkMode
                  ? Icon(Icons.sunny, size: 40)
                  : Icon(Icons.dark_mode_outlined, size: 40),
              onPressed: toggleDarkMode,
            ),
          )
        ],
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        title: Text(
          "A propos de moi ",
          style: TextStyle(
            color: Colors.red.shade300,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  MyTimeLine(
                    isFirst: true,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER Placed"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER SHIPPED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER DELIVERED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER Placed"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: false,
                    isPast: true,
                    eventCard: Text("ORDER SHIPPED"),
                  ),
                  MyTimeLine(
                    isFirst: false,
                    isLast: true,
                    isPast: false,
                    eventCard: Text("ORDER DELIVERED"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action à effectuer lors du clic sur le bouton de carte
          // Naviguer vers l'écran de la carte, par exemple
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(), // Remplacez par le nom de votre écran de carte
            ),
          );
        },
        child: Icon(Icons.map),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
