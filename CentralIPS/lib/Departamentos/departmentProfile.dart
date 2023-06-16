import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentFavorite.dart';
import 'package:centralips/Departamentos/departmentStatic.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

class DepartamentProfile extends StatelessWidget {
  Department department;
  final FirebaseAuth auth = FirebaseAuth.instance;

  DepartamentProfile(this.department, {super.key});

  void inputData(Department department) {
    final user = auth.currentUser;

    if (department.usersId.contains(user!.uid)) {
      department.usersId.remove(user.uid);
    } else {
      department.usersId.add(user.uid);
    }

    department.alterDepartmentFavorite(!department.isFavorite);

    DatabaseReference vlRef =
        FirebaseDatabase.instance.ref().child("Departamentos");
    vlRef.child(department.id).update({'usersId': department.usersId});
  }

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
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 249, 249, 249),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 140,
                                  margin:
                                      const EdgeInsets.only(left: 2, top: 50),
                                  child: Text(
                                    department.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 160,
                                  alignment: Alignment.center,
                                  child: Text(
                                    department.email.replaceAll('"', ''),
                                    style: const TextStyle(
                                      color: Color.fromRGBO(191, 195, 198, 1),
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                                child: Align(
                              alignment: const Alignment(1, 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: department.departmentFavorite,
                                    onTap: () => inputData(department),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: department.open
                                            ? const Color.fromRGBO(
                                                7, 133, 76, 1)
                                            : Colors.red,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30))),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          department.open
                                              ? Icons.check_circle
                                              : Icons.timer_off_outlined,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          department.open
                                              ? 'Aberto'
                                              : 'Fechado',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 25),
                                    height: 40,
                                    width: 145,
                                    child: TextButton(
                                        onPressed: () {},
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll<Color>(
                                                    Colors.black)),
                                        child: const Text('Mapa',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20))),
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 15,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Locais',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromARGB(255, 80, 80, 80)),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(
                              left: 10, right: 25, top: 15),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(239, 239, 239, 1)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 20, bottom: 20),
                                child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${getCampus(department.school)} - ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: getComplexString(
                                                  department.school) +
                                              (department.acronym == 'DI' ||
                                                      department.acronym == 'DA'
                                                  ? 'e de Saúde'
                                                  : ''),
                                        ),
                                        TextSpan(
                                          text: department.acronym == 'DI' ||
                                                  department.acronym == 'DA'
                                              ? '\n\n${getCampus(School.estb)} - '
                                              : '',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: department.acronym == 'DI' ||
                                                  department.acronym == 'DA'
                                              ? 'Edíficio da Escola Superior de Tecnologia do Barreiro'
                                              : '',
                                        )
                                      ]),
                                )),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Horários',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromARGB(255, 80, 80, 80)),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(
                              left: 10, right: 25, top: 15),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromRGBO(239, 239, 239, 1)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 20, bottom: 20),
                                child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: department.schedule
                                              .replaceAll('|', '\n'),
                                        ),
                                      ]),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 400,
                        )
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
            Positioned(
                left: 40,
                top: 80,
                child: Card(
                    elevation: 8,
                    color: const Color.fromRGBO(240, 247, 255, 1),
                    shape: const CircleBorder(),
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 6),
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: const Color.fromRGBO(240, 247, 255, 1),
                        ),
                        child: Text(
                          department.acronym,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(160, 164, 167, 1)),
                        )))),
          ],
        ),
      )),
      resizeToAvoidBottomInset: true,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
