import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentProfile.dart';
import 'package:centralips/Departamentos/departments.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import 'departmentExpansionPanel.dart';

class DepartmentsListView extends StatefulWidget {
  const DepartmentsListView({super.key});

  @override
  State<DepartmentsListView> createState() => DepartmentsListViewState();
}

class DepartmentsListViewState extends State<DepartmentsListView> {
  Departments departments = Departments();
  late DepartmentExpansionPanel departmentExpansionPanel;
  final FirebaseAuth auth = FirebaseAuth.instance;

  DepartmentsListViewState() {
    departmentExpansionPanel = DepartmentExpansionPanel(callSetState);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('Departamentos');
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      var departmentsData = snapshot.value as Map;

      List<Department> updatedDepartmentItems = [];
      departmentsData.forEach((key, value) {
        Department department = Department(
          id: key ?? 'na',
          acronym: value['acronym'] ?? 'Sem acrónimo',
          name: value['nome'] ?? 'Sem nome',
          open: value['open'] ?? false,
          school:
              value['school'] != null ? getSchool(value['school']) : School.na,
          usersId:
              (value['usersId'] as List).map((item) => item as String).toList(),
          email: value['email'] ?? 'Sem email',
          schedule: value['horarios'] ?? 'Sem horários disponíveis',
        );
        final user = auth.currentUser;
        department.isFavorite = department.usersId.contains(user!.uid);
        updatedDepartmentItems.add(department);
      });

      setState(() {
        departments.SetDepartments(updatedDepartmentItems);
      });
    });
  }

  void inputData(Department department) {
    final user = auth.currentUser;

    if (department.usersId.contains(user!.uid)) {
      department.usersId.remove(user.uid);
    } else {
      department.usersId.add(user.uid);
    }

    department.isFavorite = !department.isFavorite;

    DatabaseReference vlRef =
        FirebaseDatabase.instance.ref().child("Departamentos");
    vlRef.child(department.id).update({'usersId': department.usersId});
  }

  void callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Department> departmentsList =
        departments.getDepartments(departmentExpansionPanel.departmentFilter);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                '${departments.openDepartments(departmentExpansionPanel.departmentFilter)} Departamentos dísponiveis',
                style: const TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(height: 60, width: 150, child: departmentExpansionPanel),
          ],
        ),
        Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
                height: 450.0,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: departmentsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                      value: context.read<FooterMenuCubit>(),
                                      child: DepartamentProfile(
                                          departmentsList[index]),
                                    )),
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            height: 80,
                            child: Row(children: [
                              Card(
                                shape: const CircleBorder(),
                                color: const Color.fromRGBO(240, 247, 255, 1),
                                elevation: 6,
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(left: 6),
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: const Color.fromRGBO(
                                          240, 247, 255, 1),
                                    ),
                                    child: Text(
                                      departmentsList[index].acronym,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(160, 164, 167, 1)),
                                    )),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Expanded(
                                      child: Text(
                                        departmentsList[index]
                                            .getStretchedText(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    departmentsList[index].acronym,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Column(
                                        children: [
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(top: 15)),
                                          Container(
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                color: departmentsList[index]
                                                        .open
                                                    ? const Color.fromRGBO(
                                                        7, 133, 76, 1)
                                                    : Colors.red,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(30),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                30))),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                Icon(
                                                  departmentsList[index].open
                                                      ? Icons.check_circle
                                                      : Icons
                                                          .timer_off_outlined,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  departmentsList[index].open
                                                      ? 'Aberto'
                                                      : 'Fechado',
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 5)),
                                          SizedBox(
                                            height: 26,
                                            width: 26,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.favorite,
                                                color: departmentsList[index]
                                                        .isFavorite
                                                    ? Colors.red[300]
                                                    : Colors.grey,
                                              ),
                                              onPressed: () => inputData(
                                                  departmentsList[index]),
                                            ),
                                          )
                                        ],
                                      ))),
                            ])));
                  },
                )))
      ],
    );
  }
}
