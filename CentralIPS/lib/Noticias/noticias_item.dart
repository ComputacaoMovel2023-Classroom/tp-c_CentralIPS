import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NoticiaItem extends StatelessWidget {
  const NoticiaItem({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.imagem,
    required this.texto,
    required this.author,
    required this.date,
    required this.type,
    //required this.id,
  });
  final String titulo;
  final String subtitulo;
  final String imagem;
  final String texto;
  final String author;
  final String date;
  final bool type;
  //final int id;

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'subtitulo': subtitulo,
      'imagem': imagem,
      'texto': texto,
      'autor': author,
      'date': date,
      'type': type,
      // 'id': id,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
