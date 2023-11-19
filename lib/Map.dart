import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart'; // Commentez cette ligne
import 'package:provider/provider.dart';
import '../services/maps_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MapPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Commentez la ligne suivante
    // final MapsService mapsService = Provider.of<MapsService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Commentez la section du code liée à GoogleMap
      // body: GoogleMap(
      //   onMapCreated: mapsService.onMapCreated,
      //   initialCameraPosition: const CameraPosition(
      //     target: LatLng(0, 0),
      //     zoom: 15.0,
      //   ),
      //   markers: mapsService.markers,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Commentez la ligne suivante
          // mapsService.addMarker(37.7749, -122.4194, 'San Francisco');
          // mapsService.moveCamera(37.7749, -122.4194, 15.0);
        },
        tooltip: 'Ajouter un marqueur',
        child: const Icon(Icons.add_location),
      ),
    );
  }
}