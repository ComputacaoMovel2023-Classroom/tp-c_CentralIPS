import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:centralips/Noticias/noticias_list_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticiasListaItem extends StatelessWidget {
  const NoticiasListaItem({
    Key? key,
    required this.noticiaItem,
  }) : super(key: key);

  final NoticiaItem noticiaItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    value: context.read<FooterMenuCubit>(),
                    child: NoticiasListDetails(
                      noticiaItem: noticiaItem,
                    ),
                  )),
        );
      },
      child: Stack(
        children: [
          Card(
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            child: Image.network(
              noticiaItem.imagem,
              height: 150,
              width: 150,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 175),
            child: Container(
              width: 150,
              height: 40,
              child: Center(
                child: Text(
                  noticiaItem.titulo,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
