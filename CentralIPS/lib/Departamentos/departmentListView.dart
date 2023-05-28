import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentStatic.dart';
import 'package:centralips/Departamentos/departments.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import 'departmentExpansionPanel.dart';
import 'departmentFilter.dart';

class DepartmentsListView extends StatefulWidget {
  const DepartmentsListView({super.key});

  @override
  State<DepartmentsListView> createState() => DepartmentsListViewState();
}

class DepartmentsListViewState extends State<DepartmentsListView> {
  Departments departments = Departments();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('Departamentos');
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      var departmentsData = snapshot.value as Map;

      List<Department> updatedDepartmentItems = [];
      departmentsData.forEach((key, value) {
        Department department = Department(
          id: value['id'] ?? 0,
          acronym: value['acronym'] ?? 'Sem acrónimo',
          name: value['nome'] ?? 'Sem nome',
          open: value['open'] ?? false,
          school:
              value['school'] != null ? getSchool(value['school']) : School.na,
          usersId:
              (value['usersId'] as List).map((item) => item as String).toList(),
        );
        updatedDepartmentItems.add(department);
      });

      setState(() {
        departments.SetDepartments(updatedDepartmentItems);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 40,
              width: 150,
              child: Text(
                  '${departments.openDepartments()} Departamentos dísponiveis'),
            ),
            SizedBox(height: 60, width: 150, child: DepartmentExpansionPanel()),
          ],
        ),
        Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
                height: 450.0,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: departments.getDepartments().length,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        height: 80,
                        child: Row(children: [
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 6),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                color: Color.fromRGBO(186, 186, 186, 0.576),
                              ),
                              child: Text(
                                departments.getDepartments()[index].acronym,
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Expanded(
                                  child: Text(

                                    departments.getDepartments()[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                departments.getDepartments()[index].acronym,
                                style: TextStyle(
                                    fontWeight: FontWeight.w100, fontSize: 12),
                              ),
                            ],
                          )
                        ]));
                  },
                )))
      ],
    );
  }
}
