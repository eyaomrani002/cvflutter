import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'TabBar/home.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}
class _MapScreenState extends State<MapScreen> {
  String locationMessage = 'Mon Localisation ';
  late String lat;
  late String long;

  @override
  void initState() {
    super.initState();
    _openFixedLocation();
  }
  void _navigateToAboutMe() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Future<void> _openFixedLocation() async {
    double fixedLatitude = 35.613628;  // Replace with the correct latitude
    double fixedLongitude = 10.750522; // Replace with the correct longitude

    String googleURL = 'http://www.google.com/maps/search/?api=1&query=$fixedLatitude,$fixedLongitude';
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw 'Could not launch $googleURL';
    _navigateToAboutMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte'),
        backgroundColor: Colors.red.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locationMessage, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
