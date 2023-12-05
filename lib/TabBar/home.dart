import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../classes/Language.dart';
import '../classes/language_constants.dart';
import '../main.dart';
import 'About_me.dart';
import 'Experience.dart';
import 'Competence.dart';
import 'Portfolio.dart';
import 'Education.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  int selectedMenuIndex = 0;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedMenuIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = 20.0;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      key: GlobalKey<ScaffoldState>(),
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 1.0),
            child: IconButton(
              color: isDarkMode ? Colors.white : Colors.black,
              icon: isDarkMode
                  ? Icon(Icons.sunny, size: 30)
                  : Icon(Icons.dark_mode_outlined, size: 30),
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.teal,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),

        ],
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Text(
          "Curriculum Vitae",
          style: TextStyle(
            color: Colors.red.shade200,
            fontSize: 19,
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedMenuIndex,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.person, size: 30, color: Colors.grey),
          Icon(Icons.book, size: 30, color: Colors.grey),
          Icon(Icons.school, size: 30, color: Colors.grey),
          Icon(Icons.star_half, size: 30, color: Colors.grey),
          Icon(Icons.work, size: 30, color: Colors.grey),
        ],
        color: isDarkMode ? Colors.teal.shade100 : Colors.red.shade200,
        buttonBackgroundColor:
        isDarkMode ? Colors.teal.shade100 : Colors.red.shade200,
        backgroundColor:
        isDarkMode ? Colors.transparent : Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            selectedMenuIndex = index;
            _tabController.animateTo(index);
          });
        },
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 4),
        child: Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SafeArea(
                      child: About(isDarkMode: isDarkMode),
                    ),
                    SafeArea(
                      child: Experience(isDarkMode: isDarkMode),
                    ),
                    SafeArea(
                      child: Education(isDarkMode: isDarkMode),
                    ),
                    SafeArea(
                      child: Competence(isDarkMode: isDarkMode),
                    ),
                    SafeArea(
                      child: Portfolio(isDarkMode: isDarkMode),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
