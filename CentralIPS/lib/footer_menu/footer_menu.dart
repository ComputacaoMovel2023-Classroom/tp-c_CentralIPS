import 'package:flutter/material.dart';
import 'package:centralips/Ementas/ementasUI.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const Center(
      child: Text("Ementas"),
    ),
    const Center(
      child: Text("Notícias"),
    ),
    const Center(
      child: Text("Products"),
    ),
    const Center(
      child: Text("Biblioteca"),
    ),
    const Center(
      child: Text("Perfil"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmentasUI()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (index) => _changeTab(index),
      showUnselectedLabels: true,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ementas"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Notícias"),
        BottomNavigationBarItem(icon: Icon(Icons.grid_3x3_outlined), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail), label: "Biblioteca"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Perfil"),
      ],
    );
  }
}
