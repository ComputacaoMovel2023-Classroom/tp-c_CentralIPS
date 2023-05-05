import 'package:centralips/Noticias/noticia_list_item.dart';
import 'package:flutter/material.dart';

class NoticiasList extends StatelessWidget {
  NoticiasList({
    Key? key,
    required this.titulo,
    required this.textos,
  }) : super(key: key);

  final List<String> titulo;
  final List<String> textos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 500,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true, // changed from false to true
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(23),
                    child: SizedBox(
                      width: 355,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return NoticiaListItem(
                    titulo: titulo[index],
                    imagem: "assets/images/noticiaImg.png",
                    texto: textos[index],
                  );
                },
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
