import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/UTILS/progress.dart';
import 'package:centralips/homePage/home_page_ui.dart';

import 'package:centralips/register_page/register_page_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../register_page/register_page.dart';
import 'package:sign_button/sign_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Widget buildEmail() {
  FirebaseAuth auth = FirebaseAuth.instance;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          controller: _passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a sua password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildLoginBtn(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () async {
        LoadingIndicatorDialog().show(context);
        try {
          //sing out from google
          // await GoogleSignIn().signOut();
          //sing out from firebase
          await FirebaseAuth.instance.signOut();
          print(_emailController.text.trim());
          print(_passwordController.text.trim());

          final userCredential = await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
        } catch (e) {
          //print(e);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Erro'),
                content: const Text('Login Inválido'),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      LoadingIndicatorDialog().dismiss(context);
                    },
                  ),
                ],
              );
            },
          );
          return;
        }

        if (_emailController.text.trim().isNotEmpty &&
            _passwordController.text.trim().isNotEmpty) {
          final user = auth.currentUser;

          if (user != null) {
            if (user.email!.contains("admincm")) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => FooterMenuCubit(),
                          child: const HomePage() //co z<nst SplashScreen(),
                          )));
            } else if (user.emailVerified) {
              // Navigate to the home page
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => FooterMenuCubit(),
                          child: const HomePage() //co z<nst SplashScreen(),
                          )));
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Erro'),
                    content: const Text('Email não confirmado'),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          LoadingIndicatorDialog().dismiss(context);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          }
        }
        //get user is trying to login
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 60),
        ),
      ),
      child: const Text(
        'Iniciar Sessão',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildRegisterBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPage()),
      );
    },
    child: RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'Novo por aqui? ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Registar',
            style: TextStyle(
                color: Colors.blue.shade300,
                fontSize: 18,
                fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

Future<User?> signInWithGoogle({required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final GoogleSignIn googleSignIn = GoogleSignIn();

  //if user is already signed in, sign out
  await auth.signOut();
  await googleSignIn.signOut();

  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    LoadingIndicatorDialog().show(context);

    try {
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      user = userCredential.user;

      //catch error sign_in_canceled
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        LoadingIndicatorDialog().dismiss(context);
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'The account already exists with a different credential.',
            style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
          ),
        );
        // handle the error here

        // show fedback to user
      } else if (e.code == 'invalid-credential') {
        LoadingIndicatorDialog().dismiss(context);
        return null;
        // handle the error here
      } else if (e.code == 'email-already-in-use') {
        LoadingIndicatorDialog().dismiss(context);
        return null;
      }
    } catch (e) {
      LoadingIndicatorDialog().dismiss(context);
      return null;
    }

    //check if the user exists in the database
    final userRef =
        await FirebaseDatabase.instance.ref().child('users/${user!.uid}').get();
//check if the user is in the database

    //  userRef.onValue.listen((DatabaseEvent event) {
    if (!userRef.exists) {
      print("ele nao existe");
      //send to the page to complete the profile
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (_) => FooterMenuCubit(),
                  child: const RegisterPageProvider() //co z<nst SplashScreen(),
                  )));
    } else {
      //check if the user is in the database
      LoadingIndicatorDialog().dismiss(context);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (_) => FooterMenuCubit(),
                  child: const HomePage() //co z<nst SplashScreen(),
                  )));
    }
    //});
  }

  return user;
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        const Text(
                          'Iniciar Sessão',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Entre na maior comunidade do IPS',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 100),
                        buildEmail(),
                        const SizedBox(height: 15),
                        buildPassword(),
                        const SizedBox(height: 15),
                        buildLoginBtn(context),
                        const SizedBox(height: 5),
                        buildRegisterBtn(context),
                        const Divider(
                          height: 50,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SignInButton(
                            buttonType: ButtonType.google,
                            onPressed: () {
                              signInWithGoogle(context: context);
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
