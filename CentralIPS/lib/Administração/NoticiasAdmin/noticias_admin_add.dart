import 'package:centralips/Noticias/noticias_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AdminNoticiasAdd extends StatefulWidget {
  @override
  _AdminNoticiasAdd createState() => _AdminNoticiasAdd();
}

class _AdminNoticiasAdd extends State<AdminNoticiasAdd> {
  bool isNews = true;

  String title = '';
  String author = '';
  String subtitle = '';
  String text = '';
  String imageUrl = '';
  String date = '';

  void _submitForm() {
    //BASE DE DADOS - ADICIONAR NOTICIA
    final db = FirebaseDatabase.instance.ref();
    final user = FirebaseAuth.instance.currentUser;
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    date = formatter.format(now);
    NoticiaItem noticiaItem = NoticiaItem(
      titulo: title,
      subtitulo: subtitle,
      imagem: imageUrl,
      texto: text,
      author: author,
      date: date,
      type: isNews,
    );
    db.child('noticias').push().set(noticiaItem.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                child: Column(children: [
                  Row(
                    children: [
                      const Text(
                        "Adicionar Notícia",
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Título'),
                          onChanged: (value) => setState(() => title = value),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Autor'),
                          onChanged: (value) => setState(() => author = value),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Tipo:'),
                            SizedBox(width: 10),
                            ToggleButtons(
                              isSelected: [isNews, !isNews],
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text('Notícia'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text('Evento'),
                                ),
                              ],
                              onPressed: (int newIndex) {
                                setState(() {
                                  isNews = newIndex == 0;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Subtítulo'),
                          onChanged: (value) =>
                              setState(() => subtitle = value),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Texto'),
                          maxLines: 5,
                          onChanged: (value) => setState(() => text = value),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'URL da Imagem'),
                          onChanged: (value) =>
                              setState(() => imageUrl = value),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child:
                              Text('Salvar ${isNews ? 'Notícia' : 'Evento'}'),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
