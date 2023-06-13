import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentProfile.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsList {
  void getDepartment(String nameOfDepartment, BuildContext context) async {
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref("Departamentos");

    final snapshot = await databaseRef
        .orderByChild("acronym")
        .equalTo(nameOfDepartment)
        .get();

    var departmentsData = snapshot.children.first.value as Map;

    //create auth
    final auth = FirebaseAuth.instance;

    Department department = Department(
      id: snapshot.children.first.key ?? 'na',
      acronym: departmentsData['acronym'] ?? 'Sem acrónimo',
      name: departmentsData['nome'] ?? 'Sem nome',
      open: departmentsData['open'] ?? false,
      school: departmentsData['school'] != null
          ? getSchool(departmentsData['school'])
          : School.na,
      usersId: (departmentsData['usersId'] as List)
          .map((item) => item as String)
          .toList(),
      email: departmentsData['email'] ?? 'Sem email',
      schedule: departmentsData['horarios'] ?? 'Sem horários disponíveis',
    );
    final user = auth.currentUser;
    department.isFavorite = department.usersId.contains(user!.uid);

    if (context.mounted) {
      await redirectToPage(department, context);
    }

    //navigate to the department profile
  }

  Future<void> redirectToPage(
      Department department, BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: context.read<FooterMenuCubit>(),
                child: DepartamentProfile(department),
              )),
    );
  }
}
