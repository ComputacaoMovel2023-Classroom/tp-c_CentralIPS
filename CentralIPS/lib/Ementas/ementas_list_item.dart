import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:flutter/material.dart';

class EmentasListItem extends StatefulWidget {
  final int index;
  final IconData icon;
  final String weekday;
  final DailyEmenta weekdayMeals;

  const EmentasListItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.weekday,
    required this.weekdayMeals,
  }) : super(key: key);

  @override
  _EmentasListItemState createState() => _EmentasListItemState();
}

class _EmentasListItemState extends State<EmentasListItem> {
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
                    title: Text(widget.weekday),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ver ementa'),
                        Column(
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            Text(widget.weekdayMeals.date),
                          ],
                        ),
                      ],
                    ),
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.soup_kitchen_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Sopa: ${widget.weekdayMeals.sopa}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.rice_bowl_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Peixe: ${widget.weekdayMeals.peixe}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.dining_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Prato Carne: ${widget.weekdayMeals.carne}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.energy_savings_leaf_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Vegan: ${widget.weekdayMeals.vegetariano}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
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
