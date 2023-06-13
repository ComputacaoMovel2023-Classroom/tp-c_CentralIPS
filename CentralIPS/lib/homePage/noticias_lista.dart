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
    databaseRef.once().then((event) {
      DataSnapshot snapshot = event.snapshot;
      var noticiasData = snapshot.value; // Read the 'noticias' data

      if (noticiasData != null) {
        List<NoticiaItem> updatedNoticiaItems = [];

        if (noticiasData is Map) {
          // Check if noticiasData is a map
          noticiasData.entries.forEach((entry) {
            // Iterate over the entries of noticiasData
            var noticiaData = entry.value;

            if (noticiaData is Map) {
              NoticiaItem noticiaItem = NoticiaItem(
                titulo: noticiaData['titulo'] ?? 'Titulo da noticia',
                subtitulo: noticiaData['subtitulo'] ?? 'Subtitulo da noticia',
                imagem: noticiaData['imagem'] ?? 'assets/images/noticia3.png',
                texto: noticiaData['texto'] ?? 'O texto da noticia',
                author: noticiaData['autor'] ?? 'Autor desconhecido',
                date: noticiaData['date'] ?? '01/01/2021',
                type: noticiaData['type'] ?? true,
                id: entry.key,
              );
              updatedNoticiaItems.add(noticiaItem);
            }
          });
        }

        if (!mounted) return;
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
