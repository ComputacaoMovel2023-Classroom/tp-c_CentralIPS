import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'noticias_lista_item.dart';

class NoticiasLista extends StatefulWidget {
  const NoticiasLista({super.key});

  @override
  _NoticiasListaState createState() => _NoticiasListaState();
}

class _NoticiasListaState extends State<NoticiasLista> {
  List<Map<String, dynamic>> _noticiasData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseDatabase.instance.ref().child('noticias').onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      var userData = snapshot.value as Map;

      setState(() {
        _noticiasData = userData['noticias'] ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: _noticiasData.map((noticiaData) {
            return NoticiasListaItem(
              assetName:
                  noticiaData['assetName'] ?? 'assets/images/noticia1.png',
              titletext:
                  noticiaData['titletext'] ?? 'Noticia\nExemplo de texto',
            );
          }).toList(),
        );
      },
    );
  }
}
