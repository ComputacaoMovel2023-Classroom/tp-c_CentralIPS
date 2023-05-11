import 'package:centralips/Pedometro/pedometroui.dart';
import 'package:centralips/SobreNos/sobrenos.dart';
import 'package:centralips/register_page/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CampusQR/Scanner.dart';
import '../Cubit/index_cubit.dart';
import '../Departamentos/departamentsUI.dart';
import '../Ementas/ementasUI.dart';
import '../Maps/maps.dart';
import '../Maps/teste.dart';
import '../homePage/home_page_ui.dart';
import '../Bibliographic Research/bibliographicResearch.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Pedro Moura'),
            accountEmail: Text(user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/moura.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(2);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const HomePage(),
                        )));
              }),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => null,
          ),
          ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Cartão Digital'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const teste(),
                        )));
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.domain),
              title: const Text('Departamentos'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const DepartamentosUI(),
                        )));
              }),
          ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Ementas'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(0);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const EmentasUI(),
                        )));
              }),
          ListTile(
              leading: const Icon(Icons.auto_stories),
              title: const Text('Biblioteca'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(3);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const BibliographicResearch(),
                        )));
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('Campus QR'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: Scanner(),
                        )));
              }),
          ListTile(
              title: const Text('Mapa'),
              leading: const Icon(Icons.map),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const MapSample(),
                        )));
              }),
          const Divider(),
          ListTile(
              title: const Text('IPS Health'),
              leading: const Icon(Icons.health_and_safety),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const Pedometro(),
                        )));
              }),
          const Divider(),
          ListTile(
              title: const Text('Sobre Nós'),
              leading: const Icon(Icons.people),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const SobreNos(),
                        )));
              }),
          ListTile(
              title: const Text('TESTE Registo'),
              leading: const Icon(Icons.people),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const RegisterPage(),
                        )));
              })
        ],
      ),
    );
  }
}
