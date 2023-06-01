import 'package:flutter/material.dart';

class DailyEmenta extends StatelessWidget {
  DailyEmenta({
    super.key,
    required this.date,
    required this.sopa,
    required this.peixe,
    required this.carne,
    required this.vegetariano,
    required this.index,
  });

  String date;
  String sopa;
  String peixe;
  String carne;
  String vegetariano;
  int index;

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'sopa': sopa,
      'peixe': peixe,
      'carne': carne,
      'vegetariano': vegetariano,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
