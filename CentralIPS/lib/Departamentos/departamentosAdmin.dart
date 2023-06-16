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

class DepartmentsAdmin extends StatefulWidget {
  const DepartmentsAdmin({super.key});

  @override
  State<DepartmentsAdmin> createState() => DepartmentsAdminState();
}

class DepartmentsAdminState extends State<DepartmentsAdmin> {
  Departments departments = Departments();
  final FirebaseAuth auth = FirebaseAuth.instance;


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
    department.open = !department.open;

    DatabaseReference vlRef =
        FirebaseDatabase.instance.ref().child("Departamentos");
    vlRef.child(department.id).update({'open': department.open});

    setState(() {});
  }

  void callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Department> d =
        departments.getDepartments();

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
            const Text('Administração', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ],
        ),
        Flexible(
            fit: FlexFit.loose,
            child: SizedBox(
                height: 450.0,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: d.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                      value: context.read<FooterMenuCubit>(),
                                      child: DepartamentProfile(d[index]),
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
                                      d[index].acronym,
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
                                        d[index].getStretchedText(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    d[index].acronym,
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
                                                color: d[index].open
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
                                                  d[index].open
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
                                                  d[index].open
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
                                            height: 30,
                                            width: 80,
                                            child: TextButton(
                                                onPressed: () {
                                                  inputData(d[index]);
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll<
                                                            Color>(
                                                  !d[index].open
                                                      ? const Color.fromRGBO(
                                                          7, 133, 76, 1)
                                                      : Colors.red,
                                                )),
                                                child: Text(
                                                    d[index].open
                                                        ? 'Fechar'
                                                        : 'Abrir',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12))),
                                          ),
                                        ],
                                      ))),
                            ])));
                  },
                )))
      ],
    );
  }
}
