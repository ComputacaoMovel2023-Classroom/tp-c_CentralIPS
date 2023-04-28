import 'package:centralips/Ementas/ButtonsUI.dart';
import 'package:flutter/material.dart';

class EmentasUI extends StatelessWidget {
  const EmentasUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/chairsips.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(Icons.menu),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                )),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ementas",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Horário de Funcionamento",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "12h-15h",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonUI(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
