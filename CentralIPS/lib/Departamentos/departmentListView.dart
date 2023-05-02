

import 'package:centralips/Departamentos/departmentStatic.dart';
import 'package:flutter/material.dart';


class DepartmentsListView extends StatelessWidget{

  final DepartmentStaticExample departments = DepartmentStaticExample();

  DepartmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: SizedBox(
      height: 400.0,
      child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: departments.getDepartments().length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(child: Text('${departments.getDepartments()[index].acronym}-${departments.getDepartments()[index].name}')),
        );
      },
    )))
    ],);
    
  }



}
