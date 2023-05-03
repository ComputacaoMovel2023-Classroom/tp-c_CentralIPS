
import 'package:centralips/Departamentos/departmentExpansionPanel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum DepartmentFilter{
  open, closed, favorite, none;


  static DepartmentFilter getDepartmentFilter(int index){
    if(index == 0) {
      return open;
    }
    if(index == 1) {
      return closed;
    }
    if(index == 2){
      return favorite;
    }
    return none;
  }

  static String getStringFromFilter(DepartmentFilter departmentFilter){
    if(departmentFilter == open){
      return 'Dísponivel';
    }
    if(departmentFilter == closed){
      return 'Indísponivel';
    }
    if(departmentFilter == favorite){
      return 'Favorito';
    }
    return 'Nenhum';
  }

  static List<String> getDifferentFilter(DepartmentFilter departmentFilter){
    List<String> strings = [];

    for(int i = 0; i < 3; i++){
      if(getDepartmentFilter(i) != departmentFilter){
        strings.add(getStringFromFilter(getDepartmentFilter(i)));
      }
  }

    return strings;
  }
}