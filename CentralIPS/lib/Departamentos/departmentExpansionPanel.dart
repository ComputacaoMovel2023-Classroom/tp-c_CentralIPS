import 'package:centralips/Departamentos/departmentFilter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

class FilterModel {
  const FilterModel(this.filter);

  final DepartmentFilter filter;

  @override
  String toString() => DepartmentFilter.getStringFromFilter(filter);
}

class DepartmentExpansionPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DepartmentExpansionPanelState();
}

class DepartmentExpansionPanelState extends State<DepartmentExpansionPanel> {
  static const List<FilterModel> filters = <FilterModel>[
    FilterModel(DepartmentFilter.open),
    FilterModel(DepartmentFilter.closed),
    FilterModel(DepartmentFilter.favorite),
  ];

  List<DropdownMenuItem<FilterModel>> _dropdownMenuItems = [];
  FilterModel selectedFilter = filters[0];

  DepartmentExpansionPanelState() {
    _dropdownMenuItems = buildDropDownMenuItems(filters);
  }

  List<DropdownMenuItem<FilterModel>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<FilterModel>> items = List.empty(growable: true);
    for (FilterModel listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(DepartmentFilter.getStringFromFilter(listItem.filter)),
        ),
      );
    }
    return items;
  }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(filters);
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
            iconSize: 18,
            icon: Icon(
                // Add this
                Icons.arrow_drop_down, // Add this
                color: selectedFilter == filters[2]
                    ? Colors.pink[200]
                    : selectedFilter == filters[0]
                        ? Colors.green[300]
                        : Colors.red // Add this
                ),
            style: TextStyle(
                fontSize: 12,
                color: selectedFilter == filters[2]
                    ? Colors.pink[200]
                    : selectedFilter == filters[0]
                        ? Colors.green[300]
                        : Colors.red),
            value: selectedFilter,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                selectedFilter = value!;
              });
            }),
      )),
    );
  }
}
