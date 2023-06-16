import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import 'departmentFavorite.dart';

class Department extends StatefulWidget {
  String id;
  String name = "Sem Nome";
  String acronym = "N/A";
  bool open = true;
  List<String> usersId = [];
  School school = School.na;
  bool isFavorite = false;
  String email = "";
  String schedule = "";
  DepartmentFavorite departmentFavorite = DepartmentFavorite(true, 26);

  void alterDepartmentFavorite(bool greyColor, [double? size]) {
    departmentFavorite.alterData(greyColor, size);
  }

  Department(
      {Key? key,
      required this.id,
      required this.name,
      required this.acronym,
      required this.open,
      required this.usersId,
      required this.school,
      required this.email,
      required this.schedule})
      : super(key: key);

  @override
  String toString({DiagnosticLevel? minLevel}) {
    return '[$name, $acronym, $open, $school, $usersId, $email]';
  }

  Map<String, dynamic> toJson() {
    usersId.add('na');

    return {
      'nome': name,
      'acronym': acronym,
      'open': open,
      'school': school.toString(),
      'usersId': usersId,
      'email': email,
      'horarios': schedule
    };
  }

  String getStretchedText() {
    String finalString = '';

    List<String> words = name.split(' ');

    int wordsUsed = 0;

    for (String word in words) {
      if (wordsUsed == 3) {
        wordsUsed = 0;
        finalString += '\n';
      }

      finalString += ' $word';
      wordsUsed++;
    }

    return finalString;
  }

  @override
  DepartmentState createState() => DepartmentState();
}

class DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber[600],
      child: Center(child: Text(widget.name)),
    );
  }
}
