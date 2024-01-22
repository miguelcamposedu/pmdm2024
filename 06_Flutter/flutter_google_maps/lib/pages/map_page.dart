import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final LatLngBounds sydneyBounds = LatLngBounds(
  southwest: const LatLng(-34.022631, 150.620685),
  northeast: const LatLng(-33.571835, 151.325952),
);

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;
  int markerId = 0;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    ;
    await _controller?.animateCamera(CameraUpdate.newCameraPosition(_kLake));
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
