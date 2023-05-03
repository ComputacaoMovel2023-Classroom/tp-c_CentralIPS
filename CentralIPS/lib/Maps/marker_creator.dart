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
      icon: getMarkerIcon(name),
    );
  }

  static BitmapDescriptor getMarkerIcon(String color) {
    if (color.contains("Biblioteca")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else if (color.contains("Bares")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    } else if (color.contains("Cantina")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else if (color.contains("Serviços")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
    } else if (color.contains("Presidência")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta);
    } else {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
    }
  }
}
