import 'package:flutter/material.dart';

class HpCentro extends StatelessWidget {
  const HpCentro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column text = Column(children: [
      Align(
          alignment: Alignment.topLeft,
          child: Column(children: const [
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Novidades no IPS",
                  selectionColor: Colors.black,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                )),
            Text(
              "O que tem acontecido no IPS?",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
          ]))
    ]);

    return Stack(
      alignment: Alignment.topLeft,
      children: [text],
    );
  }
}
