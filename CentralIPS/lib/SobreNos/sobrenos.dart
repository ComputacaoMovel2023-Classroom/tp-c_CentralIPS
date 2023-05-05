import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget {
  const SobreNos({super.key});

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
            width: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            margin: const EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: <Widget>[
                const Text(
                  "Sobre Nós",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Image(
                  image: AssetImage('assets/images/512x512.png'),
                  height: 100,
                ),
                const Text(
                  "A CentralIPS é uma plataforma que permite à comunidade académica do Instituto Politécnico de Setúbal aceder a serviços de forma rápida e eficiente.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Text(
                  "A Nossa Equipa",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 4000,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView(
                        padding: const EdgeInsets.only(bottom: 90),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        children: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/mourabg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Pedro Moura",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/carlosbg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Carlos Luz",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/ruibg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Rui Jesus",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/andrebg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("André Caetano",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/carlosbg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Tomás Ramos",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/carlosbg.png"),
                                    fit: BoxFit.cover,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("David Ganhão",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        shadows: [
                                          Shadow(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(15, 15),
                                              blurRadius: 15),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
          const Positioned(
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
