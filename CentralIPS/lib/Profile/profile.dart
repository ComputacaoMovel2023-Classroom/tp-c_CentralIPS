import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Bibliographic%20Research/filterResearch.dart';
import 'package:centralips/Bibliographic%20Research/searchBar.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:centralips/Profile/profileOptionWidget.dart';
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
  String userName = "André Caetano";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
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
            /**
             * Bloco Branco
             */
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.only(top: 170),
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: 600,
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () => {},
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.settings,
                                  color: Color.fromRGBO(241, 237, 237, 1)),
                              const SizedBox(
                                width: 22,
                              ),
                              const Text("Editar Perfil",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Color.fromRGBO(241, 237, 237, 1))),
                            ],
                          )),
                    ),
                    const Divider(indent: 15, endIndent: 15,),
                    /**
                     * Opções de Perfil
                     */
                    ProfileOptionWidget(
                        option: "Email", value: "202100007@gmail.com"),
                    ProfileOptionWidget(option: "Número", value: "202100007"),
                    ProfileOptionWidget(option: "Função", value: "Estudante"),
                    ProfileOptionWidget(
                        option: "Primeiro Nome", value: "André"),
                    ProfileOptionWidget(option: "Sobrenome", value: "Caetano"),
                    ProfileOptionWidget(
                        option: "Data de Nascimento", value: "17/12/2021"),
                    ProfileOptionWidget(option: "Género", value: "Masculino"),
                    ProfileOptionWidget(
                        option: "Nacionalidade", value: "Portuguesa"),
                    ProfileOptionWidget(
                        option: "Curso", value: "Engenharia Informática"),
                  ],
                ),
              ),
            ),
            /**
             * Foto de Perfil
             */
            Positioned(
              top: 100,
              left: 10,
              child: Container(
                width: 400,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/moura.jpg',
                        width: 190,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: const Text(
                      "André Caetano",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
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
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
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
      )),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
