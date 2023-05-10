import 'package:centralips/Noticias/noticia_list_item.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:flutter/material.dart';

class NoticiasList extends StatelessWidget {
  NoticiasList({
    Key? key,
    required this.noticiaItemArr,
  }) : super(key: key);

  List<NoticiaItem> noticiaItemArr;

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
                itemCount: noticiaItemArr.length,
                itemBuilder: (context, index) {
                  return NoticiaListItem(noticiaItem: noticiaItemArr[index]);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
