import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_list.dart';
import 'package:flutter/material.dart';

class AdminBarClass extends StatelessWidget {
  AdminBarClass({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminEmentasList(
      type: "Bar",
    );
  }
}
