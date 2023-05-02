import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Sidebar/NavBar.dart';
import 'markers_list.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _IPS = CameraPosition(
    target: LatLng(38.52219794706464, -8.83879091164573),
    zoom: 16.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  //list to save selected items
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    Permission.location.request();

    final List<String> items = [
      'Biblioteca',
      'Bares',
      "Cantina",
      'Serviços',
      'Presidência',
    ];

    return Scaffold(
      floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              barrierColor: Colors.black.withOpacity(0.1),

              hint: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Filtros',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  //disable default onTap to avoid closing menu when selecting an item
                  enabled: false,
                  child: StatefulBuilder(
                    builder: (context, menuSetState) {
                      final isSelected = selectedItems.contains(item);
                      return InkWell(
                        onTap: () {
                          isSelected
                              ? selectedItems.remove(item)
                              : selectedItems.add(item);
                          //This rebuilds the StatefulWidget to update the button's text
                          setState(() {});
                          //This rebuilds the dropdownMenu Widget to update the check mark
                          menuSetState(() {});
                        },
                        child: Container(
                          height: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              isSelected
                                  ? const Icon(Icons.check_box_outlined)
                                  : const Icon(Icons.check_box_outline_blank),
                              const SizedBox(width: 8),
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
              value: selectedItems.isEmpty ? null : selectedItems.last,
              onChanged: (value) {},
              selectedItemBuilder: (context) {
                return items.map(
                  (item) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        selectedItems.join(', '),
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    );
                  },
                ).toList();
              },
              buttonStyleData: const ButtonStyleData(
                height: 40,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.zero,
              ),
            ),
          )),

      /*FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      )*/

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: [
          /*   Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),*/
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(top: 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                children: [
                  SizedBox(
                    child: Column(children: [
                      SizedBox(
                          //make the edges round
                          height: MediaQuery.of(context).size.height,
                          child: GoogleMap(
                            myLocationButtonEnabled: true,
                            padding: const EdgeInsets.only(
                              top: 80.0,
                            ),
                            myLocationEnabled: true,
                            mapType: MapType.hybrid,
                            initialCameraPosition: _IPS,
                            markers: MarkersList.markersToShow(selectedItems),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                          ))
                    ]),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
