import 'package:ayaomrani/TabBar/Etude.dart';
import 'package:ayaomrani/TabBar/competences.dart';
import 'package:ayaomrani/TabBar/experience.dart';
import 'package:ayaomrani/TabBar/Portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Profile.dart';
class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key});

  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Colors.pink[100], // Set the background color to light pink

        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/img.png"), // Replace with your image path
                  radius: 50, // Adjust the radius as needed
                ),
                SizedBox(width: 10), // Add some spacing between image and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aya Omrani',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Étudiante à ISET Sfax',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),


        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'profile', icon: Icon(Icons.home,size: 20)),
            Tab(text: 'etude', icon: Icon(Icons.favorite,size: 20)),
            Tab(text: 'experience', icon: Icon(Icons.person,size: 20)),
            Tab(text: 'competence', icon: Icon(Icons.person,size: 20)),
            Tab(text: 'portfilio', icon: Icon(Icons.person,size: 20)),
          ],
          indicatorColor: Colors.pink[700], // Set the indicator color to a darker shade of pink
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Profile(),
          Etude(),
          Experience(),
          Competence(),
          Portfolio(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}