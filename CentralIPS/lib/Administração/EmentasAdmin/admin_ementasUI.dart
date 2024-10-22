import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/admin_buttonsUI.dart';

import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

class AdminEmentasUI extends StatelessWidget {
  const AdminEmentasUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/chairsips.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            width: 500,
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
                children: const [
                  Text(
                    "Ementas",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Horário de Funcionamento",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "12h-15h",
                    style: TextStyle(fontSize: 16),
                  ),
                  AdminButtonUI(),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0, bottom: 0, right: 0, child: BottomNavigationExample()),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ));
              }),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
