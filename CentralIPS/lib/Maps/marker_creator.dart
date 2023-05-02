//class to create a marker

import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerCreator {
  final String id;
  final String name;
  final double lat;
  final double lng;

  //create a marker
//constructor
  const MarkerCreator(
      {required this.id,
      required this.name,
      required this.lat,
      required this.lng});

  static Marker createMarker(String id, String name, double lat, double lng) {
    return Marker(
      markerId: MarkerId(id),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: name),
      anchor: const Offset(0.5, 0.5),
      //make the mark blue
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    );
  }
}
