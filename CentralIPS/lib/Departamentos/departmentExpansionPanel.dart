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
                    leading: Icon(widget.icon),
                    title: Text(DepartmentFilter.getStringFromFilter(widget.departmentFilter)),
                  );
                },
                body: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Color.fromARGB(255, 211, 211, 211),
                  ),
                  width: 500,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              DepartmentFilter.getStringFromFilter(DepartmentFilter.closed),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              DepartmentFilter.getStringFromFilter(DepartmentFilter.open),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              DepartmentFilter.getStringFromFilter(DepartmentFilter.favorite),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
