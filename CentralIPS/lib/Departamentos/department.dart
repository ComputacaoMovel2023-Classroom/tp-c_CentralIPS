import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget {
  String id;
  String name = "Sem Nome";
  String acronym = "N/A";
  bool open = true;
  List<String> usersId = [];
  School school = School.na;

  Department(
      {Key? key,
      required this.id,
      required this.name,
      required this.acronym,
      required this.open,
      required this.usersId,
      required this.school})
      : super(key: key);

  @override
  String toString({DiagnosticLevel? minLevel}) {
    return '[$name, $acronym, $open, $school, $usersId]';
  }

  Map<String, dynamic> toJson() {
    usersId.add('na');

    return {
      'nome': name,
      'acronym': acronym,
      'open': open,
      'school': school.toString(),
      'usersId': usersId,
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
