import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_list.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_list_item.dart';
import 'package:centralips/Ementas/ementas_list.dart';
import 'package:flutter/material.dart';

class AdminRefeitorioClass extends StatelessWidget {
  AdminRefeitorioClass({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminEmentasList(
      type: "Refeitorio",
    );
  }
}
