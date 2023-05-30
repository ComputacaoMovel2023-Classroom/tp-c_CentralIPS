import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:nfc_manager/nfc_manager.dart';

class CompraUI extends StatefulWidget {
  const CompraUI({Key? key}) : super(key: key);

  @override
  _CompraUI createState() => _CompraUI();
}

class _CompraUI extends State<CompraUI> {
  String displayName = 'Não Carregado';
  String cardNumber = '---';
  String wallet = '0';
  String identifierlocal = "Não Carregado";
  String identifier = "Não Carregado";
  int toRemove = 0;

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
      setState(() {
        if (user.displayName != null) {
          displayName = user.displayName!;
        }

        if (userData['number'] != null) {
          cardNumber = userData['number'].toString();
        }

        if (userData['wallet'] != null) {
          wallet = userData['wallet'].toString();
        }

        if (userData['identifier'] != null) {
          identifier = userData['identifier'].toString();
        }
      });
    });
  }

  void _tagRead() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Encoste o cartão à traseira do dispositivo")));

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      identifierlocal = tag.data['nfca']['identifier'].toString();

      final user = FirebaseAuth.instance.currentUser;
      String identifierFromDatabase = "";

      FirebaseDatabase.instance
          .ref()
          .child('users')
          .child(user!.uid)
          .child('identifier')
          .onValue
          .listen((event) {
        // Get the snapshot of the data
        DataSnapshot snapshot = event.snapshot;

        var userData = snapshot.value;
        // Get the user's name and number
        setState(() {
          if (userData != null) {
            identifierFromDatabase = userData.toString();
          }
        });
      });

      setState(() {
        showMaterialNumberPicker(
          headerColor: Colors.blue, // background color of the header area
          headerTextColor: const Color(0xFFFFFFFF), // text fcolor of the header
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), // background color of the entire dialog
          buttonTextColor: const Color.fromARGB(
              255, 0, 0, 0), // text color of the action bar buttons
          context: context,
          title: 'Valor da compra',
          maxNumber: 100,
          minNumber: 0,
          step: 1,
          selectedNumber: toRemove,
          onChanged: (value) => setState(() {
            toRemove = value;
            final user = FirebaseAuth.instance.currentUser;
            DatabaseReference userRef = FirebaseDatabase.instance
                .ref()
                .child('users')
                .child(user!.uid)
                .child('wallet');

            if (identifierlocal != identifierFromDatabase) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cartão inválido")));
              return;
            }

            if (int.parse(wallet) - toRemove < 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Saldo insuficiente")));
              return;
            }

            int walletvalue = int.parse(wallet) - toRemove;
            userRef.set(walletvalue);
          }),
        );
      });

      NfcManager.instance.stopSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ips.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: <Widget>[
                    const Text(
                      "Simulação de Compra",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Image.asset(
                      'assets/images/512x512.png',
                      height: 50,

                      // set the height of the image
                    ),
                  ]),
                  const Padding(padding: EdgeInsets.only(bottom: 50)),
                  Container(
                      height: 210,
                      width: double.infinity,
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 39, 29, 92),
                              Color.fromARGB(255, 68, 112, 147),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0)), // Adds a gradient background and rounded corners to the container
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(displayName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: Colors.white,
                                              fontFamily:
                                                  "monospace")), // Adds a title to the card
                                  const Spacer(),
                                  Stack(children: [
                                    Image.asset(
                                      'assets/images/logoips.png',
                                      height: 60,
                                    )
                                  ]) // Adds a stack of two circular containers to the right of the title
                                ],
                              ),
                              Text(identifier,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Colors.white,
                                          fontFamily:
                                              "monospace")) // Adds a subtitle to the card
                            ],
                          ),
                          Text("€$wallet",
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors
                                      .white)) // Adds a price to the bottom of the card
                        ],
                      )),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.add),
                          title: const Text('Efetuar Compra'),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            _tagRead();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0, bottom: 0, right: 0, child: BottomNavigationExample()),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              }),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
