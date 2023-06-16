import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/material/date_picker.dart';

class AdminEmentasListItem extends StatefulWidget {
  final IconData icon;
  final String weekday;
  final DailyEmenta weekdayMeals;
  final String type;
  final VoidCallback? onRefresh;

  AdminEmentasListItem({
    Key? key,
    required this.icon,
    required this.weekday,
    required this.weekdayMeals,
    required this.type,
    this.onRefresh,
  }) : super(key: key);

  @override
  _AdminEmentasListItemState createState() => _AdminEmentasListItemState();
}

class _AdminEmentasListItemState extends State<AdminEmentasListItem> {
  List<String> daysweek = [
    'segunda-feira',
    'terça-feira',
    'quarta-feira',
    'quinta-feira',
    'sexta-feira'
  ];
  var db = FirebaseDatabase.instance.ref();

  bool _isExpanded = false;

  TextEditingController _sopaController = TextEditingController();
  TextEditingController _peixeController = TextEditingController();
  TextEditingController _carneController = TextEditingController();
  TextEditingController _vegetarianoController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2050),
    );
    if (d != null) {
      final DateFormat formatter = DateFormat('dd-MM');
      final String formatted = formatter.format(d);
      setState(() {
        _dateController.text = formatted;
        _updateMenuItem("date", _dateController.text);
      });
    }
    widget.onRefresh?.call();
  }

  @override
  void initState() {
    super.initState();
    _sopaController = TextEditingController();
    _peixeController = TextEditingController();
    _carneController = TextEditingController();
    _vegetarianoController = TextEditingController();
    _dateController = TextEditingController();
    widget.onRefresh?.call();
    setState(() {});
  }

  Future<void> _updateMenuItem(String field, String value) async {
    if (widget.weekday == 'terça-feira') {
      db.child("${widget.type}/terca-feira").update({field: value});
    } else {
      db.child("${widget.type}/${widget.weekday}").update({field: value});
    }
  }

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
                backgroundColor: Colors.white,
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
                            IconButton(
                              icon: Icon(Icons.calendar_month_outlined),
                              tooltip: 'Alterar a data',
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
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
                            child: TextField(
                              controller: _sopaController,
                              decoration: InputDecoration(
                                hintText: widget.weekdayMeals.sopa,
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _updateMenuItem("sopa", _sopaController.text);
                              });
                            },
                            child: Icon(Icons.save_outlined),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.rice_bowl_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _peixeController,
                              decoration: InputDecoration(
                                hintText: widget.weekdayMeals.peixe,
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _updateMenuItem("peixe", _peixeController.text);
                              });
                            },
                            child: Icon(Icons.save_outlined),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.dining_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _carneController,
                              decoration: InputDecoration(
                                hintText: widget.weekdayMeals.carne,
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _updateMenuItem("carne", _carneController.text);
                              });
                            },
                            child: Icon(Icons.save_outlined),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(Icons.energy_savings_leaf_outlined),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _vegetarianoController,
                              decoration: InputDecoration(
                                hintText: widget.weekdayMeals.vegetariano,
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _updateMenuItem(
                                    "vegetariano", _vegetarianoController.text);
                              });
                            },
                            child: Icon(Icons.save_outlined),
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
