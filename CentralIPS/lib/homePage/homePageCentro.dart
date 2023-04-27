import 'package:flutter/material.dart';

class hpCentro extends StatelessWidget {
  const hpCentro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column text = Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Column(children: const [
            Text(
              "Novidades No Ips",
              selectionColor: Colors.black,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "O que tem acontecido no IPS?",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ]))
    ]);

    return Stack(
      alignment: Alignment.topRight,
      children: [text],
    );
  }
}
