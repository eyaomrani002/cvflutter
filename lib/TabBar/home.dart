import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../profile/portfiliooooo.dart';
import 'About_me.dart';
import 'Profile.dart';
import 'Etude.dart';
import 'Experience.dart';
import 'Portfolio.dart';
import 'competences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Profile(),
              Etude(),
              Experience(),
              Competence(),
              Portfolio(),
              Port(),
              About(),
            ],
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:CurvedNavigationBar(
              backgroundColor: Colors.white,
              color: Color(0xFFCE6A6B), // Replace with the desired color
              animationDuration: Duration(milliseconds: 300),
              onTap: (index) {
                // Navigate to the corresponding page when a tab is tapped
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              items: [
                _buildNavItem(Icons.home, 0),
                _buildNavItem(Icons.favorite, 1),
                _buildNavItem(Icons.school, 2), // Specific icon for "Etude"
                _buildNavItem(Icons.work, 3),   // Specific icon for "Experience"
                _buildNavItem(Icons.folder, 4),// Specific icon for "Portfolio"
                _buildNavItem(Icons.folder, 5),
                _buildNavItem(Icons.folder, 6),
              ],
            ),

          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Icon(
      icon,
      color: _selectedIndex == index ? Colors.white : Colors.grey,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
