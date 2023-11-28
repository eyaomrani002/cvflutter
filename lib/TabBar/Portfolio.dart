import 'package:flutter/material.dart';

import '../portfilio/detail_screen.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Portfolio> {
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
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.5,
          children: [
            buildItemPortfilio('flutter', 'assets/img.png', 'Description for flutter'),
            buildItemPortfilio('Awesome  2', 'assets/images/food2.jpg', 'Description for food 2'),
            buildItemPortfilio('Awesome  3', 'assets/images/food3.jpg', 'Description for food 3'),
            buildItemPortfilio('Awesome  4', 'assets/images/food4.jpg', 'Description for food 4'),
            buildItemPortfilio('Awesome  1', 'assets/images/food1.jpg', 'Description for food 1'),
            buildItemPortfilio('Awesome  2', 'assets/images/food2.jpg', 'Description for food 2'),
            buildItemPortfilio('Awesome  3', 'assets/images/food3.jpg', 'Description for food 3'),
            buildItemPortfilio('Awesome  4', 'assets/images/food4.jpg', 'Description for food 4'),
          ],
        ),
      ),
    );
  }

  Widget buildItemPortfilio(String title, String img, String description) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail screen when an image is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(title, img, description),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFE9C8CE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(img, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
