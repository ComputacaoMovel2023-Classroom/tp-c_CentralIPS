import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HpSuperior extends StatefulWidget {
  const HpSuperior({Key? key}) : super(key: key);

  @override
  _HpSuperiorState createState() => _HpSuperiorState();
}

class _HpSuperiorState extends State<HpSuperior> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the data, show a loading indicator
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, show an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been received, update the user variable
          user = snapshot.data!;
          return buildContent();
        }
      },
    );
  }

  Widget buildContent() {
    Image img = Image.asset(
      'assets/images/ips.png',
      width: double.infinity,
      height: double.maxFinite,
      fit: BoxFit.cover,
    );

    SizedBox text = SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
        child: Text(
          "Bem Vindo, ${user!.displayName}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    SizedBox textbellow = const SizedBox(
      height: 50,
      width: double.infinity,
      child: Center(
        child: Text(
          "O que procura hoje no IPS?",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Stack(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            img,
            text,
            Padding(padding: const EdgeInsets.only(top: 70), child: textbellow),
          ],
        ),
      ],
    );
  }
}
