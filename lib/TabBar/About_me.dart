import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ayaomrani/Map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class About extends StatefulWidget {
  final bool isDarkMode;
  const About({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Completer<GoogleMapController> _controller = Completer();



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
    final urlScheme = 'https://www.facebook.com/aya.omrani.372';

    try {
      if (await canLaunch(urlScheme)) {
        await launch(urlScheme, forceSafariVC: false);
      } else {
        await launch('https://www.facebook.com/aya.omrani.372');
      }
    } catch (e) {
      print('Error launching Facebook: $e');
    }
  }

  _launchGitHub() async {
    final url = 'https://github.com/eyaomrani002';

    try {
      await launch(url);
    } catch (e) {
      print('Error launching GitHub profile: $e');
    }
  }

  void _navigateToMapScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,

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
                            color: widget.isDarkMode ? Colors.white : Colors.black,
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
                          AppLocalizations.of(context)!.nom,
                          style: TextStyle(
                              fontSize: 20, color: Colors.red[300]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          AppLocalizations.of(context)!.metier,
                          style: TextStyle(
                              fontSize: 15, color: Colors.lightBlueAccent),
                        ),
                        SizedBox(height: 15),
                        Text(
                          AppLocalizations.of(context)!.contact,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.isDarkMode ? Colors.white : Colors.grey,
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
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _navigateToMapScreen,
                                icon: Icons.location_on,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchLinkedIn,
                                icon: FontAwesomeIcons.linkedin,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchFacebook,
                                icon: Icons.facebook,
                                color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              child: ContactIcon(
                                onPressed: _launchGitHub,
                                icon: FontAwesomeIcons.github,
                                color: widget.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
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
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),

            // Wrap the content you want to scroll in a SingleChildScrollView
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.interet,
                      style: TextStyle(
                        fontSize: 18,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InterestIcon(
                          icon: Icons.forest,
                          label: AppLocalizations.of(context)!.camping,
                          color: widget.isDarkMode ? Colors.red.shade200 : Colors.teal,
                        ),
                        InterestIcon(
                          icon: FontAwesomeIcons.guitar,
                          label: AppLocalizations.of(context)!.music,
                          color: widget.isDarkMode ? Colors.red.shade200 : Colors.teal,
                        ),
                        InterestIcon(
                          icon: Icons.sports_gymnastics,
                          label: AppLocalizations.of(context)!.sport,
                          color: widget.isDarkMode ? Colors.red.shade200 : Colors.teal,
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
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

class InterestIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const InterestIcon({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
