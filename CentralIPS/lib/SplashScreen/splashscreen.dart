import 'package:centralips/homePage/home_page_ui.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 3;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return const HomePage();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children: <Widget>[
                  Container(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/512x512.png")),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    //margin top 30
                    child: const Text(
                      "CentralIPS",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: const Text("Versão: 1.0.0",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                        )),
                  ),
                ])));
  }
}
