import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentFavorite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

class DepartamentProfile extends StatelessWidget {
  Department department;
  final FirebaseAuth auth = FirebaseAuth.instance;

  DepartamentProfile(this.department, {super.key});

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
              color: Color.fromARGB(255, 249, 249, 249),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
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
                            height: 100,
                            width: 120,
                            margin: EdgeInsets.only(left: 2, top: 50),
                            child: Text(
                              department.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 160,
                            child: const Text(
                              'department@gmail.com',
                              style: TextStyle(
                                  color: Color.fromRGBO(206, 210, 213, 1)),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment(1, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 60,
                              height: 41,
                              child: DepartmentFavorite(department, 36),
                            ),
                            Container(
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: department.open
                                      ? Color.fromRGBO(7, 133, 76, 1)
                                      : Colors.red,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  const Icon(
                                    Icons.timer_off_outlined,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    department.open ? 'Aberto' : 'Fechado',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 25),
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
                                          color: Colors.white, fontSize: 20))),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    width: 400,
                  )
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
              left: 30,
              top: 80,
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 6),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Color.fromRGBO(240, 247, 255, 1),
                  ),
                  child: Text(
                    department.acronym,
                    style: const TextStyle(
                        fontSize: 20, color: Color.fromRGBO(160, 164, 167, 1)),
                  ))),
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
