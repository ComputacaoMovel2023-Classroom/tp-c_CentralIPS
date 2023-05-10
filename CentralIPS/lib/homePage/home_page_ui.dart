import 'package:centralips/Database/CentralDB.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';
import 'home_page_centro.dart';
import 'home_page_inferior.dart';
import 'home_page_superior.dart';
import 'noticias_lista.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//add a image to superior side of the screen
  @override
  Widget build(BuildContext context) {
    CentralDB centralDB = CentralDB();
    DatabaseReference? databaseReference = centralDB.databaseReference;

    databaseReference?.child('users').child('userId').set({
      'name': 'teste',
      'email': 'teste@teste.com',
    });

    return Scaffold(
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        /*floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          tooltip: "Home",
          child: Image.asset(
            "assets/images/homebutton.png",
            color: Colors.white,
          ),
        ),*/
        resizeToAvoidBottomInset: false,
        drawer: const NavBar(),
        bottomNavigationBar: BottomNavigationExample(),
        appBar: AppBar(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          title: const Text('Central IPS',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 251))),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.notifications),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: SizedBox(
          height: 2000,
          child: ListView(children: [
            Column(children: const [
              SizedBox(height: 300, child: HpSuperior()),
              Padding(padding: EdgeInsets.only(top: 50), child: HpCentro()),
              SizedBox(height: 300, child: NoticiasLista()),
              Padding(
                  padding: EdgeInsets.only(bottom: 100), child: HpInferior()),
            ])
          ]),
        ));
  }
}
