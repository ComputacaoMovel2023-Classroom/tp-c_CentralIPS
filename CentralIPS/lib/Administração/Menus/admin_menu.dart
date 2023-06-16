import 'package:centralips/Administra%C3%A7%C3%A3o/Biblioteca/library_manager_ui.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/Biblioteca/new_book_ui.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/admin_ementasUI.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_ui.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Departamentos/departamentsUI.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../footer_menu/footer_menu.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  const Text(
                    "Menu\n de \nAdministração",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
          
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text('Ementas',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                      leading: const Icon(Icons.restaurant),
                      title: const Text('Ementas'),
                      onTap: () {
                        context.read<FooterMenuCubit>().selectItem(2);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<FooterMenuCubit>(),
                                  child: const AdminEmentasUI(),
                                )));
                      }),
                  const Divider(),
          
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text('Noticias/Eventos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
          
                  const Divider(),
          
                  ListTile(
                      leading: const Icon(Icons.newspaper),
                      title: const Text('Noticias'),
                      onTap: () {
                        context.read<FooterMenuCubit>().selectItem(2);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<FooterMenuCubit>(),
                                  child: AdminNoticiasUI(),
                                )));
                      }),
                  const Divider(),
                  //a text to separate the menu
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text('Biblioteca',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                      title: const Text('Criar livro'),
                      leading: const Icon(Icons.library_add),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<FooterMenuCubit>(),
                                  child: const NewBookUI(),
                                )));
                      }),
                  const Divider(),
                  ListTile(
                      title: const Text('Gerenciador de livros'),
                      leading: const Icon(Icons.book),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<FooterMenuCubit>(),
                                  child: const LibraryManagerUI(),
                                )));
                      }),
                  const Divider(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text('Departamentos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                      title: const Text('Gerenciador de departamentos'),
                      leading: const Icon(Icons.business),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value: context.read<FooterMenuCubit>(),
                                  child: DepartamentosUI(true),
                                )));
                      }),
                  const Divider(),
                ]),
              ],
            ),
          ),
          
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
