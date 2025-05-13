import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowGoogleMaps extends StatefulWidget {
  const ShowGoogleMaps({super.key});

  @override
  State<ShowGoogleMaps> createState() => _ShowGoogleMapsState();
}

class _ShowGoogleMapsState extends State<ShowGoogleMaps> {
  final double lat = 22.3039;
  final double long = 70.800705;
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  bool _isMapFullScreen = false;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _zoomIn() {
    _mapController.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController.animateCamera(CameraUpdate.zoomOut());
  }

  void _searchLocation() async {
    // Here, you can implement search functionality (like using Google Places API).
    // For now, just a dummy print.
    print('Searching: ${_searchController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isMapFullScreen
          ? null
          : AppBar(
        title: const Text('Google Map Example'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 10,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(lat, long),
              ),
              Marker(
                markerId: const MarkerId("_sourceLocation"),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                position: const LatLng(22.0276, 70.6648),
              ),
            },
            zoomControlsEnabled: false, // we create our custom buttons
          ),

          // Search bar
          Positioned(
            top: 20,
            left: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search location',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) => _searchLocation(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                ],
              ),
            ),
          ),

          // Zoom buttons
          Positioned(
            bottom: 80,
            right: 15,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  heroTag: "zoom_in",
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  heroTag: "zoom_out",
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),

          // Minimize/Maximize button
          Positioned(
            bottom: 20,
            right: 15,
            child: FloatingActionButton(
              heroTag: "resize",
              onPressed: () {
                setState(() {
                  _isMapFullScreen = !_isMapFullScreen;
                });
              },
              child: Icon(_isMapFullScreen ? Icons.fullscreen_exit : Icons.fullscreen),
            ),
          ),
        ],
      ),
    );
  }
}