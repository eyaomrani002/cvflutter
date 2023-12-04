import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'About_me.dart';
import 'Experience.dart';
import 'Competence.dart';
import 'Portfolio.dart';
import 'Education.dart';
import 'package:get/get.dart';
// ... (your imports)

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
              About(),
              Experience(),
              Education(),
              Competence(),
              Portfolio(),
              // Add a Spacer here
              Container(height: 20), // Adjust the height as needed
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: Colors.red.shade300, // Active item color
                buttonBackgroundColor: Colors.red.shade200, // Background color of item
                animationDuration: Duration(milliseconds: 300),
                height: 60,
                index: _selectedIndex,
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                items: [
                  _buildNavItem(Icons.person, 0),
                  _buildNavItem(Icons.book, 1),
                  _buildNavItem(Icons.school, 2),
                  _buildNavItem(Icons.star_half, 3),
                  _buildNavItem(Icons.work, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Icon(
      icon,
      color: Colors.white,
      size: 30,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
