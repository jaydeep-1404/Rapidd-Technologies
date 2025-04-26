import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowGoogleMaps extends StatefulWidget {
  const ShowGoogleMaps({super.key});

  @override
  State<ShowGoogleMaps> createState() => _ShowGoogleMapsState();
}

class _ShowGoogleMapsState extends State<ShowGoogleMaps> {
  var lat = 22.3039;
  var long = 70.800705;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 10,

          ),
          markers: {
            Marker(
              markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(lat, long)
            ),
            Marker(
                markerId: MarkerId("_sourceLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(22.0276, 70.6648)
            ),
          },
        ),
      ),
    );
  }
}