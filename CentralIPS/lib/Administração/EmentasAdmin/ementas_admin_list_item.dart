import 'package:flutter/material.dart';

class AdminEmentasListItem extends StatefulWidget {
  IconData icon;
  String name;
  String date;
  String sopa;
  String peixe;
  String carne;
  String vegetariano;

  AdminEmentasListItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.date,
    required this.sopa,
    required this.peixe,
    required this.carne,
    required this.vegetariano,
  }) : super(key: key);

  @override
  _EmentasListItemState createState() => _EmentasListItemState();
}

class _EmentasListItemState extends State<AdminEmentasListItem> {
  bool _isExpanded = false;
  TextEditingController _sopaController = TextEditingController();
  TextEditingController _peixeController = TextEditingController();
  TextEditingController _carneController = TextEditingController();
  TextEditingController _vegetarianoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _sopaController.text = widget.sopa;
    _peixeController.text = widget.peixe;
    _carneController.text = widget.carne;
    _vegetarianoController.text = widget.vegetariano;
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
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: Icon(widget.icon),
                    title: Text(widget.name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ver ementa'),
                        Column(
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            Text(widget.date),
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
                                hintText: 'Sopa',
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.sopa = _sopaController.text;
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
                                hintText: 'Peixe',
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.peixe = _peixeController.text;
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
                                hintText: 'Carne',
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.carne = _carneController.text;
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
                                hintText: 'Vegetariano',
                              ),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.vegetariano =
                                    _vegetarianoController.text;
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
