import 'package:flutter/material.dart';
import 'homePageCentro.dart';
import 'homePageSuperior.dart';

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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(children: const [
            Expanded(
              flex: 1,
              child: hpSuperior(),
            ),
            Expanded(
              flex: 1,
              child:
                  Padding(padding: EdgeInsets.only(top: 30), child: hpCentro()),
            ),
          ]),
        ));
  }
}
