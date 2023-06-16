//class to create a marker

import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Maps/get_departments/departments_list.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  static Marker createMarkerRedirectService(String id, String name, double lat,
      double lng, String service, BuildContext context) {
    return Marker(
      markerId: MarkerId(id),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(
        title: name,
        onTap: () => redirectPage(service, context),
      ),
      anchor: const Offset(0.5, 0.5),
      //make the mark blue
      icon: getMarkerIcon("Serviços"),
    );
  }

  static BitmapDescriptor getMarkerIcon(String color) {
    if (color.contains("Biblioteca")) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else if (color.contains("Bar")) {
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

  //function to redirect to a page of the app
  static void redirectPage(String service, BuildContext context) {
    //in hear will be a switch case to redirect to the correct page
    if (service.contains("Admin")) {
      context.read<FooterMenuCubit>().selectItem(2);

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: context.read<FooterMenuCubit>(),
                  child: const HomePage(),
                )),
      );
    } else if (service.contains("Divisão")) {
      DepartmentsList m = DepartmentsList();
      m.getDepartment("DA", context);
    } else if (service.contains("Clube Desportivo")) {
      DepartmentsList m = DepartmentsList();
      m.getDepartment("CD", context);
    } else if (service.contains("IPStartup")) {
      DepartmentsList m = DepartmentsList();
      m.getDepartment("IPSUP", context);
    }
  }
}
