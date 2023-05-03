import 'package:centralips/NFC/cardWid.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

class nfcUI extends StatelessWidget {
  const nfcUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ips.png'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: <Widget>[
                    const Text(
                      "Cartão Digital",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Image.asset(
                      'assets/images/512x512.png',
                      height: 50,

                      // set the height of the image
                    ),
                  ]),
                  const SizedBox(
                    width: 400,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 50)),
                  const cardWid(),
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
