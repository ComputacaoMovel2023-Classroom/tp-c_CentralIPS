import 'package:centralips/Noticias/noticia_list.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';

import 'package:flutter/material.dart';

class NoticiasListDetails extends StatelessWidget {
  final String titulo;
  final String imagem;
  final String texto;

  const NoticiasListDetails({
    Key? key,
    required this.titulo,
    required this.imagem,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Center(
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 355,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color.fromARGB(255, 183, 183, 183),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Autor: Maria josé',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 183, 183, 183),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      Text(
                        '12/03/2021',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 183, 183, 183),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Image(image: AssetImage(imagem)),
                  ),
                  Center(
                    child: Text(
                      texto,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
              left: 0, bottom: 0, right: 0, child: BottomNavigationExample()),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
