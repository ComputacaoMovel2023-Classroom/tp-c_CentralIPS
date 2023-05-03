import 'package:centralips/Departamentos/departmentFilter.dart';
import 'package:flutter/material.dart';

class DepartmentExpandedList extends StatefulWidget {
  final IconData icon;
  DepartmentFilter departmentFilter;

  DepartmentExpandedList({
    Key? key,
    required this.icon,
    required this.departmentFilter
  }) : super(key: key);

  @override
  DepartmentExpandedListState createState() => DepartmentExpandedListState();
}

class DepartmentExpandedListState extends State<DepartmentExpandedList> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(widget.icon, size: 20),
                    title: Text(DepartmentFilter.getStringFromFilter(widget.departmentFilter), style: TextStyle(fontSize: 12),),
                  );
                },
                body: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                  ),
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(

                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () { 
                                widget.departmentFilter = DepartmentFilter.closed;
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                               },
                              child: Text(DepartmentFilter.getStringFromFilter(DepartmentFilter.closed), style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () { 
                                widget.departmentFilter = DepartmentFilter.open;
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                               },
                              child: Text(DepartmentFilter.getStringFromFilter(DepartmentFilter.open), style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () { 
                                widget.departmentFilter = DepartmentFilter.favorite;
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                               },
                              child: Text(DepartmentFilter.getStringFromFilter(DepartmentFilter.favorite), style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () { 
                                widget.departmentFilter = DepartmentFilter.none;
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                               },
                              child: Text(DepartmentFilter.getStringFromFilter(DepartmentFilter.none), style: TextStyle(fontSize: 10),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                isExpanded: _isExpanded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
