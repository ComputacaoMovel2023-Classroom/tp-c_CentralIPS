import 'package:flutter/material.dart';

class DailyEmenta extends StatelessWidget {
  const DailyEmenta({
    super.key,
    required this.date,
    required this.sopa,
    required this.peixe,
    required this.carne,
    required this.vegetariano,
  });

  final String date;
  final String sopa;
  final String peixe;
  final String carne;
  final String vegetariano;

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
