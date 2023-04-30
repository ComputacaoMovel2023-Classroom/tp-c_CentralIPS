import 'package:centralips/Ementas/ementas_list.dart';
import 'package:flutter/material.dart';

class BarClass extends StatelessWidget {
  BarClass({Key? key}) : super(key: key);

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
        EmentasList(
            sopas: sopas,
            peixes: peixes,
            carnes: carnes,
            vegetarianos: vegetarianos);
  }
}
