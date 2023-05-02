import 'package:flutter/material.dart';

class NoticiaListItem extends StatefulWidget {
  const NoticiaListItem({
    Key? key,
    required this.titulo,
    required this.imagem,
    required this.texto,
  }) : super(key: key);

  final String titulo;
  final String imagem;
  final String texto;

  @override
  _NoticiaListItemState createState() => _NoticiaListItemState();
}

class _NoticiaListItemState extends State<NoticiaListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 7),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          image: DecorationImage(
            image: AssetImage(this.widget.imagem),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 80),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    this.widget.titulo,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      this.widget.texto,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      //style: AppStyle.txtInterMedium12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
