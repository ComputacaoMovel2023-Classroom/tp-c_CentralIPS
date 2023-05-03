import 'package:centralips/Departamentos/departmentExpansionPanel.dart';
import 'package:centralips/Departamentos/departmentFilter.dart';
import 'package:centralips/Departamentos/departmentListView.dart';
import 'package:centralips/Departamentos/departmentStatic.dart';
import 'package:centralips/Ementas/ButtonsUI.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

class DepartamentosUI extends StatelessWidget {
  const DepartamentosUI({super.key});

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
                children:[
                  const Text(
                    "Departamentos",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${DepartmentStaticExample().openDepartments()} Departamentos Disponíveis',
                    style: const TextStyle(fontSize: 10),
                  ),
                  DepartmentExpandedList(icon: Icons.filter_alt_outlined, departmentFilter: DepartmentFilter.open),
                  DepartmentsListView(),
                  const SizedBox(width: 400,)


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
