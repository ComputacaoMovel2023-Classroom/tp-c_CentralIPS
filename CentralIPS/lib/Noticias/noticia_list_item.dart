import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_add.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:centralips/Noticias/noticias_list_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NoticiaListItem extends StatefulWidget {
  NoticiaListItem({Key? key, required this.noticiaItem}) : super(key: key);
  NoticiaItem noticiaItem;

  @override
  _NoticiaListItemState createState() => _NoticiaListItemState();
}

class _NoticiaListItemState extends State<NoticiaListItem> {
  bool _isPressed = false;
  String role = "Estudante";
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    FirebaseDatabase.instance
        .ref()
        .child('users')
        .child(user!.uid)
        .onValue
        .listen((event) {
      // Get the snapshot of the data
      DataSnapshot snapshot = event.snapshot;

      var userData = snapshot.value as Map;
      // Get the user's name and number

      role = userData['role'];
    });
  }

  void _OnPressed() {
    if (!mounted) return;
    setState(() {
      _isPressed = !_isPressed;
    });
    if (_isPressed) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: context.read<FooterMenuCubit>(),
                  child: NoticiasListDetails(
                    noticiaItem: widget.noticiaItem,
                  ),
                )),
      );
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
                      child: Container(
                        height: 95,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(widget.noticiaItem.imagem),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: const [
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(
                                Icons.bookmark,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6, top: 13),
                      child: Text(
                        widget.noticiaItem.type ? 'Noticia' : 'Evento',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
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
                      child: Text(widget.noticiaItem.titulo,
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
                      child: Text(widget.noticiaItem.subtitulo,
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
                            widget.noticiaItem.date,
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
