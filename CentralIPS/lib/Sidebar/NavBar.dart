import 'package:centralips/Pedometro/pedometroui.dart';
import 'package:flutter/material.dart';

import '../CampusQR/Scanner.dart';
import '../Departamentos/departamentsUI.dart';
import '../Ementas/ementasUI.dart';
import '../Maps/maps.dart';
<<<<<<< HEAD
import '../NFC/main.dart';
=======
import '../Maps/teste.dart';
>>>>>>> 1d79086da5d032bd39dc3238a000a317d47e8b67
import '../homePage/home_page_ui.dart';
import '../Bibliographic Research/bibliographicResearch.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Pedro Moura'),
            accountEmail: const Text('exemplo@gmail.com'),
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
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Cartão Digital'),
            onTap: () => Navigator.of(context)
<<<<<<< HEAD
                .push(MaterialPageRoute(builder: (context) => MyApp())),
=======
                .push(MaterialPageRoute(builder: (context) => teste())),
>>>>>>> 1d79086da5d032bd39dc3238a000a317d47e8b67
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.domain),
            title: const Text('Departamentos'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DepartamentosUI())),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Ementas'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EmentasUI())),
          ),
          ListTile(
            leading: const Icon(Icons.auto_stories),
            title: const Text('Biblioteca'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BibliographicResearch())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.qr_code_scanner),
            title: const Text('Campus QR'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Scanner())),
          ),
          ListTile(
            title: const Text('Mapa'),
            leading: const Icon(Icons.map),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MapSample())),
          ),
          const Divider(),
          ListTile(
            title: const Text('IPS Health'),
            leading: const Icon(Icons.health_and_safety),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Pedometro())),
          )
        ],
      ),
    );
  }
}
