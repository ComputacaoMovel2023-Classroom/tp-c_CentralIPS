import 'package:centralips/Ementas/BarClass.dart';
import 'package:centralips/Ementas/RefeitorioClass.dart';

import 'package:flutter/material.dart';

class ButtonUI extends StatefulWidget {
  const ButtonUI({Key? key}) : super(key: key);

  @override
  ButtonsUIState createState() => ButtonsUIState();
}

class ButtonsUIState extends State<ButtonUI> {
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
            labelColor: Color.fromARGB(255, 26, 165, 31),
            indicatorColor: Color.fromARGB(255, 16, 242, 84),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          if (_selectedIndex == 0) BarClass(), //BAR
          if (_selectedIndex == 1) RefeitorioClass(), //REFEITORIO
        ],
      ),
    );
  }
}
