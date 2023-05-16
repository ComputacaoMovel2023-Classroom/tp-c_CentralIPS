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
  bool editable = false;
  String editableText = "Editar Perfil";
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
        if (user.displayName != null) {
          userName = user.displayName!;
        }

        if (user.photoURL != null) {
          photoURL = user.photoURL!;
        }

        if (userData['birthdate'] != null) {
          birthDate = userData['birthdate'];
        }

        if (userData['number'] != null) {
          number = userData['number'];
        }

        if (userData['role'] != null) {
          role = userData['role'];
        }

        if (userData['gender'] != null) {
          gender = userData['gender'];
        }
      });
    });
  }

  String mail = "A carregar...";
  String userName = "A carregar...";
  String birthDate = "A carregar...";
  String number = "A carregar...";
  String role = "A carregar...";
  String gender = "A carregar...";
  String photoURL =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png";

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
                              onPressed: () => {
                                    setState(() {
                                      editable = !editable;
                                      if (editable) {
                                        editableText = "Salvar Perfil";
                                      } else {
                                        editableText = "Editar Perfil";
                                      }
                                    })
                                  },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.settings,
                                      color: Color.fromRGBO(241, 237, 237, 1)),
                                  const SizedBox(
                                    width: 22,
                                  ),
                                  Text(editableText,
                                      style: const TextStyle(
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
                        ProfileOptionWidget(
                          option: "Email",
                          value: mail,
                          editable: editable,
                        ),
                        ProfileOptionWidget(
                            option: "Número",
                            value: number,
                            editable: editable),
                        ProfileOptionWidget(
                            option: "Função", value: role, editable: editable),
                        ProfileOptionWidget(
                          option: "Nome de Utilizador",
                          value: userName,
                          editable: editable,
                        ),
                        ProfileOptionWidget(
                            option: "Data de Nascimento",
                            value: birthDate.toString(),
                            editable: editable),
                        ProfileOptionWidget(
                          option: "Género",
                          value: gender,
                          editable: editable,
                        )
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
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(photoURL),
                      backgroundColor: Colors.transparent,
                    ),
                    Container(
                        child: Text(
                      userName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
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
