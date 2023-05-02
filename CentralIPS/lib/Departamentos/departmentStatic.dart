
import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/school.dart';

class DepartmentStaticExample{
  
  List<Department> departments = [];

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
      Department(name: "Departamento de Ciências Biomédicas", acronym: "DCB", open: true, favorite: false, school: School.ess),
      Department(name: "Departamento de Ciências da Comunicação e Linguagem", acronym: "DCCL", open: false, favorite: false, school: School.ess),
      Department(name: "Departamento de Ciências Sociais e Humanas", acronym: "DCSH", open: true, favorite: false, school: School.ess),
      Department(name: "Departamento de Enfermagem", acronym: "DE", open: true, favorite: false, school: School.ess),
      Department(name: "Departamento de Fisioterapia", acronym: "DF", open: true, favorite: false, school: School.ess)
    ];

    return essDepartments;
  }

  List<Department> estbDepartments(){
    List<Department> estbDepartments = [
      Department(name: "Departamento de Economia Civil", acronym: "DEC", open: true, favorite: false, school: School.estb),
      Department(name: "Departamento de Engenharia Química e Biológica", acronym: "DEQB", open: false, favorite: false, school: School.estb),
      Department(name: "Departamento de Matemática e Informática", acronym: "DMI", open: true, favorite: true, school: School.estb)
    ];

    return estbDepartments;
  }

  List<Department> esceDepartments(){
    List<Department> esceDepartments = [
      Department(name: "Departamento de Economia e Gestão", acronym: "DEG", open: true, favorite: false, school: School.esce),
      Department(name: "Departamento de Comportamento Organizacional e Gestão de Recursos Humanos", acronym: "DRH", open: false, favorite: false, school: School.esce),
      Department(name: "Departamento de Contabilidade e Finanças", acronym: "DCF", open: true, favorite: true, school: School.esce),
      Department(name: "Departamento de Marketing e Logística", acronym: "DML", open: true, favorite: false, school: School.esce),
      Department(name: "Departamento de Sistemas de Informação", acronym: "DSI", open: false, favorite: true, school: School.esce)
    ];

    return esceDepartments;
  }

  List<Department> estsDepartments(){
    List<Department> estsDepartments = [
      Department(name: "Departamento de Matemática", acronym: "DMAT", open: true, favorite: false, school: School.ests),
      Department(name: "Departamento de Engenharia Mecânica", acronym: "DEM", open: false, favorite: false, school: School.ests),
      Department(name: "Departamento de Engenharia Eletrotécnica", acronym: "DEE", open: true, favorite: true, school: School.ests),
      Department(name: "Departamento de Sistemas e Informática", acronym: "DSI", open: true, favorite: false, school: School.ests),
      Department(name: "Secção de Ciências Empresariais e Comunicação", acronym: "SeCEC", open: false, favorite: true, school: School.ests)
    ];

    return estsDepartments;
  }

  List<Department> eseDepartments(){
    List<Department> eseDepartments = [
      Department(name: "Departamento de Artes", acronym: "DA", open: true, favorite: false, school: School.ese),
      Department(name: "Departamento de Ciências da Educação e Supervisão", acronym: "DCES", open: false, favorite: false, school: School.ese),
      Department(name: "Departamento de Ciências da Natureza", acronym: "DCN", open: true, favorite: true, school: School.ese),
      Department(name: "Departamento de Ciências do Desporto e Educação Física", acronym: "DCDEF", open: true, favorite: false, school: School.ese),
      Department(name: "Departamento de Ciências Sociais", acronym: "DCS", open: false, favorite: true, school: School.ese),
      Department(name: "Departamento de Línguas Estrangeiras", acronym: "DLE", open: true, favorite: true, school: School.ese),
      Department(name: "Departamento de Matemática", acronym: "DM", open: false, favorite: false, school: School.ese),
      Department(name: "Departamento de Português", acronym: "DP", open: true, favorite: false, school: School.ese),
      Department(name: "Departamento de Psicologia", acronym: "DPsi", open: false, favorite: false, school: School.ese),
      Department(name: "Departamento de Tecnologia Educativa e Gestão de Informação", acronym: "DTEGI", open: false, favorite: false, school: School.ese)
    ];

    return eseDepartments;
  }

}