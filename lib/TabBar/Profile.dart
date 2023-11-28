import 'package:ayaomrani/profile/ProgressBarCustom.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFCE6A6B),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Skills', style: TextStyle(color: Colors.white, fontSize: 18)),
                  SizedBox(height: 30.0),
                  ProgressBarCustom(skill: 'Backend Developer', porcentaje: '95', color: Color(0xffFFFFFF),barra: 250.0),
                  ProgressBarCustom(skill: 'Web Developer', porcentaje: '80', color: Color(0xffFFFFFF), barra: 250.0),
                  ProgressBarCustom(skill: 'Flutter', porcentaje: '75', color: Color(0xffFFFFFF), barra: 210.0),
                  ProgressBarCustom(skill: 'Laravel', porcentaje: '80', color: Color(0xffFFFFFF), barra: 250.0),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
