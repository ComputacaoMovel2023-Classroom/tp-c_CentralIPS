import 'package:centralips/Noticias/noticias_item.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';

import 'package:flutter/material.dart';

class NoticiasListDetails extends StatelessWidget {
  final NoticiaItem noticiaItem;

  const NoticiasListDetails({
    Key? key,
    required this.noticiaItem,
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
                image: AssetImage('assets/images/jornais.jpeg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Center(
                          child: Text(
                            noticiaItem.titulo,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: double.infinity),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              noticiaItem.author,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 183, 183, 183),
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            Text(
                              noticiaItem.date,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 183, 183, 183),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text(
                            noticiaItem.subtitulo,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image(
                            image: NetworkImage(noticiaItem.imagem),
                          ),
                        ),
                        Center(
                          child: Text(
                            noticiaItem.texto,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 230),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                leading: Builder(builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () => {
                            Navigator.pop(context)
                          },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ));
                }),
              ),
            )
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
