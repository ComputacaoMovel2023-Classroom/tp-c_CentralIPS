

import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/departmentFilter.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Departments {
  List<Department> departments = [];

  void SetDepartments(List<Department> newDepartments){
    departments = newDepartments;
  }

  List<Department> getDepartments([DepartmentFilter? departmentFilter]){
    if(departmentFilter == null)
      return departments;

    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final newDepartments = <Department>[];

    for(Department department in departments){

      if((departmentFilter.name == 'open' && department.open) || (departmentFilter.name == 'closed' && !department.open) || 
      (departmentFilter.name == 'favorite' && department.usersId.contains(user!.uid))) {
        newDepartments.add(department);
      }

    }

    return newDepartments;
  }

  int openDepartments([DepartmentFilter? departmentFilter]){
    int number = 0;

    for (Department d in getDepartments(departmentFilter)) {
      if(d.open) {
        number++;
      }
     }

     return number;
  }
}