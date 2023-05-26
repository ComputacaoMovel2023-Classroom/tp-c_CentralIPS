import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/homePage/home_page_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../register_page/register_page.dart';

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
        try {
          final userCredential = await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
        } catch (e) {
          print(e);
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
