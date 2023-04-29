import 'package:flutter/material.dart';

class EmentasListItem extends StatefulWidget {
  final IconData icon;
  final String name;
  final String id;

  const EmentasListItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  _EmentasListItemState createState() => _EmentasListItemState();
}

class _EmentasListItemState extends State<EmentasListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
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
            );
          },
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: const [
                SizedBox(height: 10),
                Text(
                  'Sopa: ',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  'Prato Principal: ',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}
