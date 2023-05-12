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
  bool editable = false;
  String editableText = "Editar Perfil";
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: const EdgeInsets.only(top: 140),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    width: 600,
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () => {
                                    setState(() { 
                                      editable = !editable;
                                      if (editable) {
                                        editableText = "Salvar Perfil";
                                      } else {
                                        editableText = "Editar Perfil";
                                      }
                                    })
                                  },
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
                                  Text(editableText,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Color.fromRGBO(
                                              241, 237, 237, 1))),
                                ],
                              )),
                        ),
                        const Divider(
                          indent: 15,
                          endIndent: 15,
                        ),
                        /**
                         * Opções de Perfil
                         */
                        ProfileOptionWidget(
                            option: "Email", value: "202100007@gmail.com",editable: editable,),
                        ProfileOptionWidget(
                            option: "Número", value: "202100007",editable: editable,),
                        ProfileOptionWidget(
                            option: "Função", value: "Estudante",editable: editable,),
                        ProfileOptionWidget(
                            option: "Primeiro Nome", value: "André",editable: editable,),
                        ProfileOptionWidget(
                            option: "Sobrenome", value: "Caetano",editable: editable,),
                        ProfileOptionWidget(
                            option: "Data de Nascimento", value: "17/12/2021",editable: editable,),
                        ProfileOptionWidget(
                            option: "Género", value: "Masculino",editable: editable,),
                        ProfileOptionWidget(
                            option: "Nacionalidade", value: "Portuguesa",editable: editable,),
                        ProfileOptionWidget(
                            option: "Curso", value: "Engenharia Informática",editable: editable,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /**
             * Foto de Perfil
             */
            Positioned(
              top: 100,
              left: 0,
              right: 0,
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
