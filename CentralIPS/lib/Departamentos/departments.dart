

import 'package:centralips/Departamentos/department.dart';


class Departments {
  List<Department> departments = [];

  void SetDepartments(List<Department> newDepartments){
    departments = newDepartments;
  }

  List<Department> getDepartments(){
    return departments;
  }

  int openDepartments(){
    int number = 0;

    for (Department d in departments) {
      if(d.open) {
        number++;
      }
     }

     return number;
  }
}