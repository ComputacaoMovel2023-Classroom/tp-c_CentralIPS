import 'package:flutter/material.dart';

class Top3LeaderBord extends StatelessWidget {
  const Top3LeaderBord(
      {super.key,
      required this.nameFirst,
      required this.nameSecond,
      required this.nameThird,
      required this.stepsFirst,
      required this.stepsSecond,
      required this.stepsThrid});

  final String nameFirst;
  final String nameSecond;
  final String nameThird;

  final String stepsFirst;
  final String stepsSecond;
  final String stepsThrid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 40, // Tamanho do primeiro círculo
          backgroundColor: Colors.blue,
        ),
        SizedBox(width: 16), // Espaço entre os círculos
        CircleAvatar(
          radius: 60, // Tamanho do círculo do meio (maior)
          backgroundColor: Colors.red,
        ),
        SizedBox(width: 16), // Espaço entre os círculos
        CircleAvatar(
          radius: 40, // Tamanho do último círculo
          backgroundColor: Colors.green,
        ),
      ],
    );
  }
}
