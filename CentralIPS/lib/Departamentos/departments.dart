

import 'dart:async';

import 'package:centralips/Departamentos/department.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_database/firebase_database.dart';


class Departments {
  final DatabaseReference departmentDb = FirebaseDatabase.instance.ref("Departamentos");
  Map<String, Department> departments = {};


  Departments(){

    fetchData();

  }

  List<Department> getDepartments(){
    return List.of(departments.values);
  }

  int openDepartments(){
    int number = 0;

    for (Department d in departments.values) {
      if(d.open) {
        number++;
      }
     }

     return number;
  }

  void fetchData(){
    
    departmentDb.onValue.listen((event) {
      final data = event.snapshot.value;

      var newData = data.toString().split('-');

      for(String d in newData){
        String newString = d;
        
        newString = newString.replaceAll('{', '');
        newString = newString.replaceAll('}', '');
        newString = newString.replaceAll(',', '');
        newString = newString.replaceFirst(':', '');
        newString = newString.replaceAll(': ', ':');
        newString = newString.trim();

        List<String> values = newString.split(' ');

        if(values.length >= 6) {
          departments[values[0]] = Department(
          name: getName(values),
          acronym: getAcronym(values), 
          open: getOpen(values), 
          usersId: getUsersId(values), 
          school: getSchool(values[2].replaceAll('school:', ''))
         );
        }

      }

      return;
    });
  }



  bool getOpen(List<String> values){
    bool open = values.last == 'true' ? true : false;
    return open;
  }

  String getAcronym(List<String> values){
    String newString = values[1].replaceAll('acronym:', '');
    return newString;
  }

  String getName(List<String> values){
    String newString = '';
    
    for(int i = 4; i < values.length - 1; i++){
      newString += ' ${values[i].replaceAll('nome:', '')}';
    }
    return newString.trim();
  }

  dynamic getUsersId(List<String> values){
        String newString = values[3].replaceAll('usersId:', '');
        newString = newString.replaceAll('[', '');
        newString = newString.replaceAll(']', '');
        newString = newString.replaceAll(' ', '');

        var users = [];

        for(String s in newString.split(',')){
          users.add(s);
        } 

        return users;
      }
}