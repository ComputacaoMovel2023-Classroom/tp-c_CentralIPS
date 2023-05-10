import 'package:centralips/Noticias/noticia_list.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';

import 'package:flutter/material.dart';

class NoticiasUI extends StatelessWidget {
  NoticiasUI({Key? key});
/*
  List<NoticiaItem> title = [
    "To Kill a Mockingbird",
    "1984",
    "The Great Gatsby"
  ];

  List<NoticiaItem> txt = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor orci risus, at pharetra nibh ultrices sit amet. Maecenas eu tincidunt orci. Aliquam id dui eget urna lobortis commodo at eget quam. Integer posuere enim nisl, a faucibus erat maximus eu. Praesent et mi lectus. Suspendisse potenti. Quisque vel lorem sed nunc pharetra facilisis. Sed varius urna nec velit consequat, ac tincidunt ipsum consequat. In hac habitasse platea dictumst. Fusce ac ipsum vel justo congue convallis. Aenean eu enim velit. Donec eget ultricies nibh, in interdum turpis. Vivamus malesuada pharetra metus, non bibendum nulla tristique vel. Sed eu sapien vestibulum, imperdiet nulla ac, dapibus lorem.',
    'Vivamus vitae eros quis arcu pharetra maximus. Donec mollis nisl sed dolor suscipit, eu sollicitudin tellus aliquet. Integer venenatis libero sit amet lectus volutpat, at suscipit nisi dictum. Quisque pellentesque felis sit amet augue commodo elementum. Etiam eget augue a nibh ultrices faucibus vel in sapien. Curabitur lacinia ante quis massa dictum, eu tristique neque tristique. Duis vel bibendum arcu. Proin iaculis ex mauris, vel convallis eros congue vitae. Donec ultricies nulla sed augue consequat aliquam. Fusce eget luctus eros, sit amet pulvinar urna. Aliquam erat volutpat. Suspendisse maximus sed enim sit amet posuere. Nam euismod ipsum vel ante pulvinar, et lobortis quam dignissim.',
    'Pellentesque eget fringilla nulla, in consequat velit. Suspendisse rutrum lectus a nibh sollicitudin, id hendrerit nulla dictum. Sed pharetra a mi in bibendum. Vestibulum quis neque id odio aliquet blandit. Integer vitae nulla eget magna pretium vehicula. Pellentesque in enim eget nisi malesuada varius sit amet euismod nibh. Sed rhoncus imperdiet ipsum, vel pulvinar eros hendrerit nec. Suspendisse at dolor sagittis, finibus nisi et, faucibus dolor. Suspendisse convallis nec dolor eget commodo. Maecenas euismod neque sed lacus posuere, vel varius quam semper. Vivamus eget mauris congue, luctus ex non, maximus ante. Suspendisse vitae quam fermentum, gravida massa sed, fringilla arcu.'
  ];*/
  List<NoticiaItem> noticiaItemArr = [
    NoticiaItem(
      titulo: "Noticia 1",
      subtitulo: "Subtitulo 1",
      imagem: "imagem1.jpg",
      texto: "Texto da noticia 1",
    ),
    NoticiaItem(
      titulo: "Noticia 2",
      subtitulo: "Subtitulo 2",
      imagem: "imagem2.jpg",
      texto: "Texto da noticia 2",
    ),
    NoticiaItem(
      titulo: "Noticia 3",
      subtitulo: "Subtitulo 3",
      imagem: "imagem3.jpg",
      texto: "Texto da noticia 3",
    ),
  ];

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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Noticias",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                elevation: 0,
                                minimumSize: const Size(45, 35),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Filtros",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const SizedBox(
                    width: 355,
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color.fromARGB(255, 183, 183, 183),
                    ),
                  ),
                  Expanded(
                    child: Column(children: [
                      NoticiasList(noticiaItemArr: noticiaItemArr.toList()),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
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
