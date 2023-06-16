import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:centralips/Ementas/ementas_list.dart';

import 'package:flutter/material.dart';

class RefeitorioClass extends StatefulWidget {
  const RefeitorioClass({super.key});
  @override
  State<RefeitorioClass> createState() => _RefeitorioClassState();
}

class _RefeitorioClassState extends State<RefeitorioClass> {
  List<DailyEmenta> weekdayMeals = [];

  @override
  Widget build(BuildContext context) {
    return EmentasList(
      type: "Refeitorio",
    );
  }
}
