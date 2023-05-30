import 'package:centralips/Administra%C3%A7%C3%A3o/Menus/admin_menu.dart';
import 'package:centralips/NFC/nfcUI.dart';
import 'package:centralips/Pedometro/pedometroui.dart';
import 'package:centralips/SobreNos/sobrenos.dart';
import 'package:centralips/WelcomeScreen/welcome_screen.dart';
import 'package:centralips/register_page/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CampusQR/Scanner.dart';
import '../Cubit/index_cubit.dart';
import '../Departamentos/departamentsUI.dart';
import '../Ementas/ementasUI.dart';
import '../Maps/maps.dart';
import '../Profile/profile.dart';
import '../homePage/home_page_ui.dart';
import '../Bibliographic Research/bibliographicResearch.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //dispose
  @override
  void dispose() {
    super.dispose();
  }

  var role = "Estudante";
  String? _userName = "A carregar";
  String? photoURL =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";
  @override
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

      if (!mounted) return;

      setState(() {
        _userName = user.displayName;
        if (user.photoURL != null) {
          photoURL = user.photoURL!;
        }
      });
      role = userData['role'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:
                _userName != null ? Text(_userName!) : const Text('Loading...'),
            accountEmail: Text(user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(photoURL!),
              backgroundColor: Colors.transparent,
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
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const Profile(),
                        )),
              )
            },
          ),
          ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Cartão Digital'),
              onTap: () {
                context.read<FooterMenuCubit>().selectItem(-1);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: const nfcUI(),
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
                          child: DepartamentosUI(),
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
          Visibility(
            visible: role ==
                "Administrador", // Set the visibility based on the condition
            child: ListTile(
                title: const Text('Administração'),
                leading: const Icon(Icons.people),
                onTap: () {
                  context.read<FooterMenuCubit>().selectItem(-1);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: context.read<FooterMenuCubit>(),
                            child: const AdminMenu(),
                          )));
                }),
          ),
          ListTile(
              title: const Text('Sair'),
              leading: const Icon(Icons.logout),
              onTap: () {
                FirebaseAuth.instance.signOut();

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: context.read<FooterMenuCubit>(),
                          child: WelcomeScreen(),
                        )));
              })
        ],
      ),
    );
  }
}
