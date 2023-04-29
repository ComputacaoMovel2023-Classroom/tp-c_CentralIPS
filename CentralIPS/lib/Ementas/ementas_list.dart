import 'package:centralips/Ementas/ementas_list_item.dart';
import 'package:flutter/material.dart';

class EmentasList extends StatelessWidget {
  EmentasList({Key? key}) : super(key: key);

  List<String> weekdays = [
    'segunda-feira',
    ' terça-feira',
    ' quarta-feira',
    'quinta-feira',
    'sexta-feira'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 500, // provide a fixed height
        child: ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return EmentasListItem(
              icon: Icons.restaurant,
              name: weekdays[index],
              date: '12/3',
            );
          },
        ),
      ),
    );
  }
}
