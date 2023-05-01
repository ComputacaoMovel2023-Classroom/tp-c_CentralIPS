//class to create a list of markers

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'marker_creator.dart';

class MarkersList {
  //create a marker

  static Set<Marker> createMarkersList() {
    return {
      MarkerCreator.createMarker(
          //create a marker
          '1',
          'Biblioteca',
          38.52219794706464,
          -8.8387909116451),
      MarkerCreator.createMarker(
          //create a marker
          '2',
          'Bares',
          38.52170664311205,
          -8.83924769550607),
    };
  }
}
