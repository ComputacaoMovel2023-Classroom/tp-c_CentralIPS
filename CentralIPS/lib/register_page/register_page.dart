import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../loginPage/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

Widget buildName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Nome Completo',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.name,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu nome',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildNumber() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Número de Estudante',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza o seu número',
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
      Text(
        'Password',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 6, left: 10),
              hintText: 'Introduza a sua password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildRegisterBtn() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print('Conta Registada!'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 60),
        ),
      ),
      child: const Text(
        'Registar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildLoginBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
    child: RichText(
      text: TextSpan(children: [
        TextSpan(
            text: 'Já tem uma conta? ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Iniciar Sessão',
            style: TextStyle(
                color: Colors.blue.shade300,
                fontSize: 18,
                fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

class _RegisterPageState extends State<RegisterPage> {
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
                  decoration: BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5),
                        Text(
                          'Registar',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Registe-se na nossa aplicação',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 60),
                        buildName(),
                        SizedBox(height: 15),
                        buildEmail(),
                        SizedBox(height: 15),
                        buildNumber(),
                        SizedBox(height: 15),
                        buildPassword(),
                        SizedBox(height: 15),
                        buildRegisterBtn(),
                        SizedBox(height: 5),
                        buildLoginBtn(context),
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
