
import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_database/firebase_database.dart';

class DepartmentStaticExample{
  
  final DatabaseReference departmentDb = FirebaseDatabase.instance.ref("Departamentos");
  List<Department> departments = [];

  /*

  DepartmentStaticExample(){

    departments.addAll(essDepartments());
    departments.addAll(estsDepartments());
    departments.addAll(estbDepartments());
    departments.addAll(eseDepartments());
    departments.addAll(esceDepartments());
  }

  List<Department> getDepartments(){
    return departments;
  }

  int openDepartments(){
    int number = 0;

    for (var d in departments) {
      if(d.open) {
        number++;
      }
     }

     return number;
  }

  List<Department> essDepartments(){
    List<Department> essDepartments = [
      Department(email: '', id: '', name: "Departamento de Ciências Biomédicas", acronym: "DCB", open: true, school: School.ess, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências da Comunicação e Linguagem", acronym: "DCCL", open: false, school: School.ess, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências Sociais e Humanas", acronym: "DCSH", open: true, school: School.ess, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Enfermagem", acronym: "DE", open: true, school: School.ess, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Fisioterapia", acronym: "DF", open: true, school: School.ess, usersId: List.empty(growable: true))
    ];

    return essDepartments;
  }

  List<Department> estbDepartments(){
    List<Department> estbDepartments = [
      Department(email: '', id: '', name: "Departamento de Economia Civil", acronym: "DEC", open: true, school: School.estb, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Engenharia Química e Biológica", acronym: "DEQB", open: false, school: School.estb, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Matemática e Informática", acronym: "DMI", open: true, school: School.estb, usersId: List.empty(growable: true))
    ];

    return estbDepartments;
  }

  List<Department> esceDepartments(){
    List<Department> esceDepartments = [
      Department(email: '', id: '', name: "Departamento de Economia e Gestão", acronym: "DEG", open: true, school: School.esce, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Comportamento Organizacional e Gestão de Recursos Humanos", acronym: "DRH", open: false, school: School.esce, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Contabilidade e Finanças", acronym: "DCF", open: true, school: School.esce, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Marketing e Logística", acronym: "DML", open: true, school: School.esce, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Sistemas de Informação", acronym: "DSI", open: false, school: School.esce, usersId: List.empty(growable: true))
    ];

    return esceDepartments;
  }

  List<Department> estsDepartments(){
    List<Department> estsDepartments = [
      Department(email: '', id: '', name: "Departamento de Matemática", acronym: "DMAT", open: true, school: School.ests, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Engenharia Mecânica", acronym: "DEM", open: false, school: School.ests, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Engenharia Eletrotécnica", acronym: "DEE", open: true, school: School.ests, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Sistemas e Informática", acronym: "DSI", open: true, school: School.ests, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Secção de Ciências Empresariais e Comunicação", acronym: "SeCEC", open: false, school: School.ests, usersId: List.empty(growable: true))
    ];

    return estsDepartments;
  }

  List<Department> eseDepartments(){
    List<Department> eseDepartments = [
      Department(email: '', id: '', name: "Departamento de Artes", acronym: "DA", open: true, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências da Educação e Supervisão", acronym: "DCES", open: false, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências da Natureza", acronym: "DCN", open: true, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências do Desporto e Educação Física", acronym: "DCDEF", open: true, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Ciências Sociais", acronym: "DCS", open: false, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Línguas Estrangeiras", acronym: "DLE", open: true, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Matemática", acronym: "DM", open: false, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Português", acronym: "DP", open: true, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Psicologia", acronym: "DPsi", open: false, school: School.ese, usersId: List.empty(growable: true)),
      Department(email: '', id: '', name: "Departamento de Tecnologia Educativa e Gestão de Informação", acronym: "DTEGI", open: false, school: School.ese, usersId: List.empty(growable: true))
    ];

    return eseDepartments;
  }

  void addDepartment(Department department) {
    departmentDb.push().set(department.toJson());
  }
  */
}