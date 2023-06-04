import 'package:centralips/Noticias/noticias_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'noticias_lista_item.dart';

class NoticiasLista extends StatefulWidget {
  const NoticiasLista({Key? key}) : super(key: key);

  @override
  _NoticiasListaState createState() => _NoticiasListaState();
}

class _NoticiasListaState extends State<NoticiasLista> {
  List<NoticiaItem> noticiaItemArr = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final user = FirebaseAuth.instance.currentUser;
    DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child('noticias');
    databaseRef.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null && snapshot.value is Map) {
        var noticiasData = snapshot.value as Map<dynamic, dynamic>;

        List<NoticiaItem> updatedNoticiaItems = [];
        noticiasData.forEach((key, value) {
          if (value is Map) {
            NoticiaItem noticiaItem = NoticiaItem(
              titulo: value['titulo'] ?? 'Titulo da noticia',
              subtitulo: value['subtitulo'] ?? 'Subtitulo da noticia',
              imagem: value['assetName'] ?? 'assets/images/noticia3.png',
              texto: value['texto'] ?? 'O texto da noticia',
              author: value['author'] ?? 'Ana Matos',
              date: value['date'] ?? '01/01/2021',
              type: value['type'] ?? true,
            );
            updatedNoticiaItems.add(noticiaItem);
          }
        });

        setState(() {
          noticiaItemArr = updatedNoticiaItems;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: noticiaItemArr.map((noticiaData) {
            return NoticiasListaItem(
              assetName: noticiaData.imagem,
              titletext: noticiaData.titulo,
            );
          }).toList(),
        );
      },
    );
  }
}
