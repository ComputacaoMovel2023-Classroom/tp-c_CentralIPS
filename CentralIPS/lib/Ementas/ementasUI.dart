import 'package:centralips/Ementas/ButtonsUI.dart';
import 'package:centralips/Ementas/ementas_list.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

class EmentasUI extends StatelessWidget {
  const EmentasUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Scaffold(
          //bottomNavigationBar: const BottomNavigationExample(),
          resizeToAvoidBottomInset: false,
          drawer: const NavBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ementas",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Horário de Funcionamento",
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      "12h-15h",
                      style: TextStyle(fontSize: 16),
                    ),
                    const ButtonUI(),
                    EmentasList()
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
