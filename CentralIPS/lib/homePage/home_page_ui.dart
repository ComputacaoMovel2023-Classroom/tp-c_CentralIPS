import 'package:flutter/material.dart';

import 'home_page_centro.dart';
import 'home_page_inferior.dart';
import 'home_page_superior.dart';
import 'noticias_lista.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

//add a image to superior side of the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('Central IPS'),
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
              Padding(padding: EdgeInsets.only(top: 100), child: HpCentro()),
              SizedBox(height: 150, child: NoticiasLista()),
              Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 300),
                  child: HpInferior()),
            ])
          ]),
        ));
  }
}
