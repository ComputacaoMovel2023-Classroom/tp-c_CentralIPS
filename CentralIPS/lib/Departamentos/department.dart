
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget{

  String name = "Sem Nome";
  String acronym = "N/A";
  bool open = true;
  bool favorite = false;
  School school = School.na;

  Department({
    Key? key,
    required this.name,
    required this.acronym,
    required this.open,
    required this.favorite,
    required this.school
  }) : super(key: key);

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

