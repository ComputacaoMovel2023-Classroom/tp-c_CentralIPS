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
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia2.png",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia3.png",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia1.png",
        ),
        NoticiasListaItem(
          assetName: "assets/images/noticia2.png",
        ),
      ],
    );
  }
}
