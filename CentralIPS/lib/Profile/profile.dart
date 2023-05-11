import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Bibliographic%20Research/filterResearch.dart';
import 'package:centralips/Bibliographic%20Research/searchBar.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:searchable_listview/searchable_listview.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
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
            child: Container(
              padding: const EdgeInsets.only(
                  top: 35, left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      const Text(
                        "Biblioteca",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SearchBar(),
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
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
