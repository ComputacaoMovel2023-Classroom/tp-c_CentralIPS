import 'package:flutter/material.dart';

import 'noticias_lista_item.dart';

class NoticiasLista extends StatelessWidget {
  const NoticiasLista({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        NoticiasListaItem(
          assetName: "assets/images/noticia1.png",
          titletext: "Noticia 1\nExemplo de texto",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia2.png",
          titletext: "Noticia 2\nExemplo de texto",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia3.png",
          titletext: "Noticia 3\nExemplo de texto",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia1.png",
          titletext: "Noticia 4\nExemplo de texto",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia2.png",
          titletext: "Noticia 5\nExemplo de texto",
        ),
      ],
    );
  }
}
