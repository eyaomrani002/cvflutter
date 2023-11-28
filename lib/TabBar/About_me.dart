import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool isDarkMode = false;
  Completer<GoogleMapController> _controller = Completer();

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _launchPhone() async {
    const url = 'tel:+21646326522';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'ayaomrani002@gmail.com',
    );

    try {
      await launch(emailUri.toString());
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  _launchLinkedIn() async {
    final url = 'https://www.linkedin.com/in/eya-omrani-ab55b42a0/';

    try {
      await launch(url);
    } catch (e) {
      print('Error launching LinkedIn profile: $e');
    }
  }

  void _launchFacebook() async {
    final urlScheme =
        'https://www.facebook.com/aya.omrani.372';

    try {
      if (await canLaunch(urlScheme)) {
        // Try launching with the Facebook app
        await launch(urlScheme, forceSafariVC: false);
      } else {
        // Launch in a web browser if the app is not installed
        await launch('https://www.facebook.com/aya.omrani.372');
      }
    } catch (e) {
      print('Error launching Facebook: $e');
    }
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: isDarkMode ? Colors.white : Colors.black,
                            width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/img.png',
                        fit: BoxFit.cover,
                        height: 205,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aya Omrani ",
                          style: TextStyle(
                              fontSize: 20, color: Colors.red[300]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Développeur Full-Stack ",
                          style: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 16,
                            color: isDarkMode ? Colors.white : Colors.grey,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchPhone,
                                icon: Icons.phone,
                                color: Colors.blue.shade900,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchEmail,
                                icon: Icons.email,
                                color: Colors.blue.shade400,
                              ),
                            ),
                            SizedBox(width: 25),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchFacebook,
                                icon: Icons.link,
                                color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchFacebook,
                                icon: Icons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Je suis une étudiante en informatique talentueuse et compétente à  ISET de Sfax, âgée de 21 ans. J ai une passion pour la technologie et un fort désir d apprendre et de progresser. Mes compétences comprennent plusieurs langages de programmation et technologies. Je suis une apprenante rapide et une joueuse d équipe dévouée. Je suis enthousiaste à l idée de relever de nouveaux défis et de contribuer au monde de la technologie.' ,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
           /* Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:',
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 30,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Rte Mahdia 3.5km, Sfax, Tunisia',
                          style: TextStyle(
                            fontSize: 18,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(34.7573643, 10.7724747),
                        zoom: 15,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId('marker_id'),
                          position: LatLng(34.7573643, 10.7724747),
                          infoWindow: InfoWindow(
                              title: 'Marker Title', snippet: 'Marker Snippet'),
                        ),
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class ContactIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  const ContactIcon({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 30,
          color: color,
        ),
      ),
    );
  }
}