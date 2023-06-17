import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_bar.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_refeitorio.dart';


import 'package:flutter/material.dart';

class AdminButtonUI extends StatefulWidget {
  const AdminButtonUI({Key? key}) : super(key: key);

  @override
  AdminButtonsUIState createState() => AdminButtonsUIState();
}

class AdminButtonsUIState extends State<AdminButtonUI> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _selectedIndex,
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(
                text: "Bar",
                icon: Icon(Icons.bakery_dining),
              ),
              Tab(
                text: "Refeitório",
                icon: Icon(Icons.food_bank),
              ),
            ],
            labelColor: const Color.fromARGB(255, 99, 254, 104),
            indicatorColor: const Color.fromARGB(255, 77, 247, 165),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          if (_selectedIndex == 0) AdminBarClass(), //BAR
          if (_selectedIndex == 1) AdminRefeitorioClass(), //RESTAURANTE
        ],
      ),
    );
  }
}
