import 'package:centralips/Ementas/ementasUI.dart';
import 'package:centralips/Ementas/ementas_list.dart';
import 'package:flutter/material.dart';

class BarClass extends StatelessWidget {
  const BarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        /* padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          Text(
            "Bar Class",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            "This is the content of the Bar Class",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),*/
        EmentasList();
  }
}
