import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  int markerId = 0;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3803587, -6.0075884),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        onTap: (LatLng pos) {
          _onMapTapped(pos);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  _onMapTapped(LatLng latLng) {
    markerId++;
    final Marker marker = Marker(
      markerId: MarkerId(markerId.toString()),
      position: latLng,
      infoWindow: InfoWindow(title: markerId.toString(), snippet: '*'),
      onTap: () => _onMarkerTapped(markerId),
    );
  }

  _onMarkerTapped(int markerId) {}
}
