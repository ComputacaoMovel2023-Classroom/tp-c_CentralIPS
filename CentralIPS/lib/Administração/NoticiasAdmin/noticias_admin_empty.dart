import 'package:centralips/Administra%C3%A7%C3%A3o/NoticiasAdmin/noticias_admin_add.dart';
import 'package:flutter/material.dart';

class AdminNoticiasEmpty extends StatelessWidget {
  const AdminNoticiasEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jornais.jpeg'),
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
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      "Noticias",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              elevation: 0,
                              minimumSize: const Size(45, 35),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Mudar para eventos",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                const SizedBox(
                  width: 355,
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color.fromARGB(255, 183, 183, 183),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 180,
                  ),
                  child: Text(
                    "Não existem notícias!",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Image(image: AssetImage('assets/images/semnoticias.png')),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    elevation: 0,
                    minimumSize: const Size(45, 35),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminNoticiasAdd()),
                    );
                  },
                  child: const Text(
                    "Adicionar Notícia",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
