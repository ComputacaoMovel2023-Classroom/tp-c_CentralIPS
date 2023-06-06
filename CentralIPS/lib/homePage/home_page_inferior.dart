import 'package:flutter/material.dart';

class HpInferior extends StatelessWidget {
  const HpInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img = Image.asset(
      'assets/images/phonecarousel.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );

    Column text = Column(children: [
      Align(
          alignment: Alignment.center,
          child: Center(
              child: Column(children: const [
            Text(
              "O Campus\n na Palma da Mão",
              textAlign: TextAlign.center,
              selectionColor: Colors.black,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Através da CentralIPS pode aceder a todas as funcionalidades relacionadas com o Instituto.",
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ])))
    ]);

    return Column(children: [
      SizedBox(height: 162, child: text),
      const Padding(padding: EdgeInsets.only(top: 50)),
      SizedBox(height: 260, child: img)
    ]);
  }
}
