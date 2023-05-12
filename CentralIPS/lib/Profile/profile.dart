import 'package:centralips/Profile/profileOptionWidget.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
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
        mail = user.email!;
        userName = userData['name'];
        birthDate = userData['birthdate'];
        number = userData['number'];
        role = userData['role'];
        gender = userData['gender'];
        debugPrint(userData['birthdate']);
      });
    });
  }

  String mail = "A carregar...";
  String userName = "A carregar...";
  String birthDate = "A carregar...";
  String number = "A carregar...";
  String role = "A carregar...";
  String gender = "A carregar...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/header.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                /**
                 * Bloco Branco
                 */
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 140),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 600,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () => {},
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Icon(Icons.settings,
                                      color: Color.fromRGBO(241, 237, 237, 1)),
                                  SizedBox(
                                    width: 22,
                                  ),
                                  Text("Editar Perfil",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Color.fromRGBO(
                                              241, 237, 237, 1))),
                                ],
                              )),
                        ),
                        const Divider(
                          indent: 15,
                          endIndent: 15,
                        ),
                        /**
                         * Opções de Perfil
                         */
                        ProfileOptionWidget(option: "Email", value: mail),
                        ProfileOptionWidget(option: "Número", value: number),
                        ProfileOptionWidget(option: "Função", value: role),
                        ProfileOptionWidget(
                            option: "Nome de Utilizador", value: userName),
                        ProfileOptionWidget(
                            option: "Data de Nascimento",
                            value: birthDate.toString()),
                        ProfileOptionWidget(option: "Género", value: gender)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /**
             * Foto de Perfil
             */
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/moura.jpg',
                        width: 190,
                        height: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        child: const Text(
                      "André Caetano",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
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
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                }),
              ),
            ),
          ],
        ),
      )),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
