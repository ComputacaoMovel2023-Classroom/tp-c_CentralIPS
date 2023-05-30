import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/ementas_admin_list.dart';
import 'package:centralips/Ementas/ementas_list.dart';
import 'package:flutter/material.dart';

class AdminRefeitorioClass extends StatelessWidget {
  AdminRefeitorioClass({super.key});

  final List<String> sopas = [
    'Sopa de legumes',
    'Creme de abóbora',
    'Caldo verde',
    'Canja de galinha',
    'sopa de tomate'
  ];
  final List<String> peixes = [
    'Bacalhau à Brás',
    'Arroz de marisco',
    'Salmão grelhado',
    'Filetes de pescada',
    'Bacalhau com natas'
  ];
  final List<String> carnes = [
    'Bife grelhado',
    'Frango assado',
    'Almôndegas com esparguete',
    'Lombo de porco',
    'Bife de peru'
  ];
  final List<String> vegetarianos = [
    'Lasanha de legumes',
    'Feijoada vegetariana',
    'Quiche de tofu',
    'Hambúrguer de grão-de-bico',
    'Arroz de legumes'
  ];
  @override
  Widget build(BuildContext context) {
    return AdminEmentasList(
      type: "Refeitorio",
    );
  }
}
