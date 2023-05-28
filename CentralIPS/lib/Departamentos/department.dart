
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget{

  String name = "Sem Nome";
  String acronym = "N/A";
  bool open = true;
  var usersId = [];
  School school = School.na;

  Department({
    Key? key,
    required this.name,
    required this.acronym,
    required this.open,
    required this.usersId,
    required this.school
  }) : super(key: key);

  @override
  String toString({DiagnosticLevel? minLevel}){
    return '[$name, $acronym, $open, $school, $usersId]';
  }

  Map<String, dynamic> toJson() {
    usersId.add("teste");
    return {
      'nome': name,
      'acronym': acronym,
      'open': open,
      'school': school.toString(),
      'usersId': usersId,
    };
  }

  @override
  DepartmentState createState() => DepartmentState();

}
class DepartmentState extends State<Department>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.amber[600],
      child: Center(child: Text(widget.name)),
    );
  }

}



