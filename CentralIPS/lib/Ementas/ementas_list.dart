import 'package:centralips/Ementas/ementas_list_item.dart';
import 'package:flutter/material.dart';

class EmentasList extends StatelessWidget {
  EmentasList({
    Key? key,
    required this.sopas,
    required this.peixes,
    required this.carnes,
    required this.vegetarianos,
  }) : super(key: key);

  final List<String> diassemana = [
    'segunda-feira',
    'terça-feira',
    'quarta-feira',
    'quinta-feira',
    'sexta-feira'
  ];
  final List<String> sopas;
  final List<String> peixes;
  final List<String> carnes;
  final List<String> vegetarianos;
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(23),
                    child: SizedBox(
                      width: 355,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
                itemCount: diassemana.length,
                itemBuilder: (context, index) {
                  String sopa = sopas[index];
                  String peixe = peixes[index];
                  String carne = carnes[index];
                  String vegetariano = vegetarianos[index];

                  return EmentasListItem(
                    icon: Icons.restaurant,
                    name: diassemana[index],
                    date: '12/3',
                    sopa: sopa,
                    peixe: peixe,
                    carne: carne,
                    vegetariano: vegetariano,
                  );
                },
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
