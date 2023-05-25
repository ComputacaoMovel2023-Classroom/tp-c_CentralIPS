import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../register_page/register_page.dart';
import '../loginPage/login_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Widget buildLoginBtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 60),
        ),
      ),
      child: const Text(
        'Inicia Sessão',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget buildRegisterButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, 60),
        ),
      ),
      child: const Text(
        'Regista-te',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                        SizedBox(height: 100),
                        Container(
                          child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Image.asset("assets/images/512x512.png")),
                        ),
                        Text(
                          'Bem Vindo!',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          'Regista-te na Central IPS ou faz Login abaixo',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 20),
                        buildRegisterButton(context),
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
