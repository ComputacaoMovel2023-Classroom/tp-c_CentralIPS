import 'package:centralips/Administra%C3%A7%C3%A3o/EmentasAdmin/admin_ementasUI.dart';
import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_ui.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      body: Column(children: [
        ListTile(
            leading: const Icon(Icons.home),
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
        ListTile(
            leading: const Icon(Icons.home),
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
      ]),
    );
  }
}
