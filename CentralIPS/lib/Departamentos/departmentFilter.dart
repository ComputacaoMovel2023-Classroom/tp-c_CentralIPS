
import 'package:centralips/Departamentos/departmentExpansionPanel.dart';
import 'package:fl_chart/fl_chart.dart';

enum DepartmentFilter{
  open, closed, favorite;


  static DepartmentFilter getDepartmentFilter(int index){
    if(index == 0) {
      return open;
    }
    if(index == 1) {
      return closed;
    }
    return favorite;
  }

  static String getStringFromFilter(DepartmentFilter departmentFilter){
    if(departmentFilter == open){
      return 'Dísponivel';
    }
    if(departmentFilter == closed){
      return 'Indísponivel';
    }
    return 'Favorito';
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