import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_add.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_list_item.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Noticias/noticias_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminNoticiaList extends StatefulWidget {
  AdminNoticiaList({
    Key? key,
    this.onUpdate,
    required this.noticiaItemArr,
  }) : super(key: key);
  final VoidCallback? onUpdate;
  List<NoticiaItem> noticiaItemArr;

  @override
  State<AdminNoticiaList> createState() => _AdminNoticiaListState();
}

class _AdminNoticiaListState extends State<AdminNoticiaList> {
  int id = 0;
  void _submitForm() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => BlocProvider.value(
                value: context.read<FooterMenuCubit>(),
                child: AdminNoticiasAdd(),
              )),
    );
    widget.onUpdate?.call();
  }

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
              Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 0,
                  minimumSize: const Size(45, 35),
                ),
                onPressed: _submitForm,
                child: const Text(
                  'Adicionar Noticia',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
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
                  //id = index;

                  return AdminNoticiaListItem(
                    noticiaItem: noticiaItem,
                    onUpdate: () {
                      setState(() {
                        widget.noticiaItemArr.remove(noticiaItem);
                      });
                    },
                  );
                  //update dps ids
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
