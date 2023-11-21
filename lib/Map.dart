
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String locationMessage = 'Current Location of User';
  late String lat;
  late String long;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        throw Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Future.error('Location permissions are permanently denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'latitude: $lat , longitude: $long';
      });
    });
  }

  Future<void> _openMap(String lat, String long) async {
    String googleURL = 'http://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw 'Could not launch $googleURL';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locationMessage, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'latitude: $lat, longitude: $long';
                  });
                  _liveLocation();
                });
              },
              child: const Text('Get Current Location'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: const Text('Open Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}