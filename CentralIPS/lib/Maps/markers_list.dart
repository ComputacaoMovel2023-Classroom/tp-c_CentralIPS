//class to create a list of markers

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'marker_creator.dart';

class MarkersList {
  //create a marker

  static Set<Marker> createMarkersList() {
    Set<Marker> markersList = {};
    markersList.addAll(MarkersList.createMarkersLibrary());
    markersList.addAll(MarkersList.createMarkersPresidential());
    return markersList;
  }

  //create funtion to return a list of markers of a specific type
  static Set<Marker> createMarkersLibrary() {
    return {
      MarkerCreator.createMarker(
          //create a marker
          '1',
          'Biblioteca Esce',
          38.52268004886502,
          -8.841180580191452),
      MarkerCreator.createMarker(
          //create a marker
          '2',
          'Biblioteca ESE',
          38.52167494603904,
          -8.838653335908793),
      MarkerCreator.createMarker(
          //create a marker
          '3',
          'Biblioteca EST',
          38.51998885958507,
          -8.838206923064766),
    };
  }

  static Set<Marker> createMarkersPresidential() {
    return {
      MarkerCreator.createMarker(
          //create a marker
          '4',
          'Presidência',
          38.523291014865336,
          -8.840683012325519),
    };
  }

  static Set<Marker> createMarkersCantina() {
    return {
      MarkerCreator.createMarker(
          //create a marker
          '5',
          'Cantina',
          38.52243698802391,
          -8.839528892221596),
    };
  }

  static Set<Marker> createMarkersServices() {
    return {
      MarkerCreator.createMarker(
          "8", "Admin", 38.52175457085821, -8.839865325375564)
    };
  }

  static Set<Marker> markersToShow(List<String> selectedItems) {
    //set of markers to return
    Set<Marker> markersList = {};

    //if list of selected items is empty, return all markers
    if (selectedItems.isEmpty) {
      return MarkersList.createMarkersList();
    } //if list of selected items is not empty, return markers of selected items
    else {
      //for each item in the list of selected items
      for (var item in selectedItems) {
        //if item is Biblioteca
        if (item == 'Biblioteca') {
          //add markers of Biblioteca to the list of markers to return
          markersList.addAll(createMarkersLibrary());
        }
        //if item is Presidência
        if (item == 'Presidência') {
          //add markers of Presidência to the list of markers to return
          markersList.addAll(createMarkersPresidential());
        }
        if (item == "Cantina") {
          markersList.addAll(createMarkersCantina());
        }
        if (item == "Serviços") {
          markersList.addAll(createMarkersServices());
        }
      }

      return markersList;
    }
  }
}
