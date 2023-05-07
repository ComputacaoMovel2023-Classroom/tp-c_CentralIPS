import 'package:centralips/Noticias/noticias_list_details.dart';
import 'package:flutter/material.dart';

class AdminNoticiaListItem extends StatefulWidget {
  const AdminNoticiaListItem({
    Key? key,
    required this.titulo,
    required this.subtitulo,
    required this.imagem,
    required this.texto,
  }) : super(key: key);

  final String titulo;
  final String subtitulo;
  final String imagem;
  final String texto;

  @override
  _AdminNoticiaListItemState createState() => _AdminNoticiaListItemState();
}

class _AdminNoticiaListItemState extends State<AdminNoticiaListItem> {
  bool _isPressed = false;

  void _OnPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
    if (_isPressed) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => NoticiasListDetails(
            titulo: widget.titulo, imagem: widget.imagem, texto: widget.texto),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _OnPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey[100]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(left: 1, top: 3),
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 95,
                            width: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/noticiaImg.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                //BASE DE DADOS - Remover container
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 6, top: 13),
                      child: Text(
                        "Notícia",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 182, 182, 182),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      margin: const EdgeInsets.only(left: 1, top: 6),
                      child: Text(widget.titulo,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    Container(
                      width: 500,
                      margin: const EdgeInsets.only(left: 1, top: 6),
                      child: Text(widget.subtitulo,
                          maxLines: null,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1, top: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jun 12, 2021",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 9,
                              color: Colors.grey[500],
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 2,
                            margin: const EdgeInsets.only(
                                left: 4, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
