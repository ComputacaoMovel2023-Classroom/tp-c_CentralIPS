import 'package:centralips/Noticias/noticia_list_item.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class NoticiasList extends StatefulWidget {
  NoticiasList({
    Key? key,
    required this.noticiaItemArr,
  }) : super(key: key);

  List<NoticiaItem> noticiaItemArr;

  @override
  State<NoticiasList> createState() => _NoticiasListState();
}

class _NoticiasListState extends State<NoticiasList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 550,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                itemCount: widget.noticiaItemArr.length,
                itemBuilder: (context, index) {
                  NoticiaItem noticiaItem = widget.noticiaItemArr[index];
                  //print('AOAO: ${noticiaItem.titulo}');
                  return NoticiaListItem(
                    noticiaItem: noticiaItem,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
