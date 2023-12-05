import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Competence extends StatefulWidget {
  final bool isDarkMode;
  const Competence({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  State<Competence> createState() => _ExperienceState();
}

class ExperienceItem {
  final String title;
  final String description;

  ExperienceItem({required this.title, required this.description});
}

class _ExperienceState extends State<Competence> {

  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;
  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == experienceList.length - 1) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBottomAppBar = false;
        setState(() {});
      } else {
        showBottomAppBar = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    carouselTimer?.cancel();
    super.dispose();
  }

  bool showBottomAppBar = true;

  List<ExperienceItem> experienceList = [

    ExperienceItem(
      title: "Développeur Frontend",
      description: "Conception d'interfaces utilisateur en utilisant React ,JavaScript,Angular ,HTML,CSS et Next Js",
    ),
    ExperienceItem(
      title: "Développeur Backend",
      description: "onsiste à concevoir, développer et maintenir la logique serveur de l'application en utilisant des technologies telles que Java, Python, Node.js,",
    ),
    ExperienceItem(
      title: "Développeur Full Stack",
      description: "mise en œuvre de la logique serveur et des fonctionnalités côté serveur.",
    ),
    // Add more experiences as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,

      body: SafeArea(

        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                              Text("Hello you tapped at ${index + 1}"),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carouselTimer?.cancel();
                          carouselTimer = null;
                        },
                        onPanCancel: () {
                          carouselTimer = getTimer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 8,
                            left: 8,
                            top: 24,
                            bottom: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: widget.isDarkMode ? Colors.teal : Color(0xFFCE8F8A),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  experienceList[index].title,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  experienceList[index].description,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: experienceList.length,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  experienceList.length,
                      (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? (widget.isDarkMode ?  Color(0xFFCE8F8A):Colors.teal )
                            : Colors.grey.shade300,

                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: showBottomAppBar
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.centerFloat,
    );
  }
}
class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class Project {

  final String imageUrl;

  Project({

    required this.imageUrl,
  });
}

class _GridBState extends State<GridB> {
  final List<Project> projects = [
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5iJa0nfWBSghUxupD8Z8a7pI9vB1VKVGWodsuEsovBE593sqmwwKyn5L0I6nuvoBydgI&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdV2bglU-TCvp7x2uaRp4fTqNPTUB3YiJ7Ng&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7axW36M5EY2BWVrmVnJINJQ8WY0sdZGFchA&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqj-DuchpfOknjE4TYoWIeDHzNLD42GK20E6xKeB9L22VdpD0jVNqad_VgB0y_1TEUJtg&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpzCCDmldlu6vAT394sfQ1i3St-l6u2zqziA&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROyraAPA2vQr_ahZ9pvOW-rsjjIDOYrx5Qgw&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuP5yUKrd7wTIbhurAe_dXijKgYyRti3TI1Q&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReTFnAQfryV92SZpjU66ai_Ti1gkiL7U6-5g&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-Jp6R2qbT9YT8bt7MhQMO16Xm-73STiuDjw&usqp=CAU",
    ),
    Project(

      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjvcqOWskUQPvq5nw1bYJa_FpN7AJi7Uhxgw&usqp=CAU",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 2.0, // Réduisez cet espacement vertical selon vos besoins
        mainAxisExtent: 310,
      ),
      itemCount: projects.length,
      itemBuilder: (_, index) {
        Project project = projects[index];
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  project.imageUrl,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}