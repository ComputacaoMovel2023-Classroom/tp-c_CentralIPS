import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Bibliographic%20Research/filterResearch.dart';
import 'package:centralips/Bibliographic%20Research/searchBar.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

import 'package:searchable_listview/searchable_listview.dart';


class BibliographicResearch extends StatefulWidget {
  const BibliographicResearch({Key? key}) : super(key: key);

  @override
  State<BibliographicResearch> createState() => BibliographicResearchUI();
}

class BibliographicResearchUI extends State<BibliographicResearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/header.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Biblioteca",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10, width: 400),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterResearch()),
                            )
                          },
                      child: Text("Filtros")),
                  Divider(color: Colors.black,),
                  const SearchBar(),
                ],
              ),
            ),
          ),
          const Positioned(
              left: 0, bottom: 0, right: 0, child: BottomNavigationExample()),
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
}
