import 'package:centralips/Ementas/daily_ementa.dart';
import 'package:centralips/Ementas/ementas_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BarClass extends StatefulWidget {
  BarClass({Key? key}) : super(key: key);
  @override
  State<BarClass> createState() => _BarClassState();
}

class _BarClassState extends State<BarClass> {
  List<DailyEmenta> weekdayMeals = [];

  @override
  Widget build(BuildContext context) {
    return EmentasList(
      type: "Bar",
    );
  }
}
