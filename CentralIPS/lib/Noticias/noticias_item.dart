import 'package:flutter/material.dart';

class NoticiaItem extends StatelessWidget {
  const NoticiaItem({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.imagem,
    required this.texto,
  });
  final String titulo;
  final String subtitulo;
  final String imagem;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
