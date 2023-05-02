
import 'package:centralips/Bibliographic%20Research/bibliographicResearch.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:flutter/material.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';

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
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmentasUI()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EmentasUI()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BibliographicResearch()),
        );
        break;
      default:
    }
  }

/*
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (index) => _changeTab(index),
      showUnselectedLabels: true,
      selectedItemColor: const Color.fromRGBO(169, 188, 212, 1),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/refeitorio.png"),
            label: "Ementas"),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/noticias.png"), label: "Notícias"),
        BottomNavigationBarItem(
          icon: Container(),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/biblioteca.png"),
            label: "Biblioteca"),
        BottomNavigationBarItem(
            icon: Image.asset("assets/images/perfil.png"), label: "Perfil"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Column(children: [
                Image.asset("assets/images/refeitorio.png"),
                const Expanded(child: Text("Ementas"))
              ]),
              //label: "Ementas",
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset("assets/images/noticias.png"), onPressed: () {},
              //label: "Notícias"
            ),
            IconButton(
              icon: Container(),
              //label: "",
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset("assets/images/biblioteca.png"),
              //label: "Biblioteca"
              onPressed: () => {},
            ),
            IconButton(
                icon: Image.asset("assets/images/perfil.png"),
                // label: "Perfil"
                onPressed: () => {}),
          ],
        ));
  }*/
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      height: 70,
      style: TabStyle.fixedCircle,
      activeColor: const Color.fromARGB(255, 85, 152, 233),
      color: const Color.fromRGBO(169, 188, 212, 1),
      backgroundColor: Colors.white70,
      items: [
        TabItem(
            icon: Image.asset("assets/images/refeitorio.png"),
            title: 'Ementas'),
        TabItem(
            icon: Image.asset("assets/images/noticias.png"), title: 'Notícias'),
        TabItem(
            icon: Image.asset("assets/images/homebutton.png"), title: 'Home'),
        TabItem(
            icon: Image.asset("assets/images/biblioteca.png"),
            title: 'Biblioteca'),
        TabItem(icon: Image.asset("assets/images/perfil.png"), title: 'Perfil'),
      ],
      onTap: (index) => _changeTab(index),
    );
  }
}
