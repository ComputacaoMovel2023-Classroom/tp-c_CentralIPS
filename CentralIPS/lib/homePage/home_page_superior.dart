import 'package:flutter/material.dart';

class HpSuperior extends StatelessWidget {
  const HpSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Image img = Image.asset(
      'assets/images/ips.png',
      width: double.infinity,
      height: double.maxFinite,
      fit: BoxFit.cover,
    );

    SizedBox text = const SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
          child: Text("Bem Vindo, Pedro!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))),
    );

    SizedBox textbellow = const SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
          child: Text("O que procura hoje no IPS?",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ))),
    );

    return Stack(children: [
      Stack(
        alignment: Alignment.center,
        children: [
          img,
          text,
          Padding(padding: const EdgeInsets.only(top: 70), child: textbellow)
        ],
      ),
    ]);
  }
}
