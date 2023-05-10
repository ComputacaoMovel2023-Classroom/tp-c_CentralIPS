import 'package:centralips/Bibliographic%20Research/bibliographicResearch.dart';
import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Bibliographic%20Research/documentType.dart';
import 'package:centralips/Bibliographic%20Research/filterOption.dart';
import 'package:centralips/Bibliographic%20Research/searchBar.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

class FilterResearch extends StatefulWidget {
  const FilterResearch({Key? key}) : super(key: key);

  @override
  State<FilterResearch> createState() => FilterResearchState();
}

class FilterResearchState extends State<FilterResearch> {
  bool availability = false;
  int numberOfResults = 0;
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Stack(
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BibliographicResearch()),
                                    )
                                  },
                              icon: const Icon(Icons.arrow_back_ios)),
                          const Padding(padding: EdgeInsets.only(left: 90)),
                          const Text(
                            "Filtros",
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10, width: 400),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: const Text('Disponível',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w900,
                                        ))),
                                Switch.adaptive(
                                  // thumb color (round icon)
                                  activeColor: Colors.white,
                                  activeTrackColor:
                                      Color.fromRGBO(85, 56, 236, 100),
                                  inactiveThumbColor: Colors.white,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  splashRadius: 50.0,
                                  // boolean variable value
                                  value: availability,
                                  // changes the state of the switch
                                  onChanged: (value) =>
                                      setState(() => availability = value),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 50,
                              indent: 0,
                              color: Color.fromRGBO(215, 217, 217, 0.612),
                            ),
                            FilterWidget(
                              title: "Categoria",
                              options: getCategoryNames(),
                            ),
                            const Divider(
                              height: 50,
                              indent: 0,
                              color: Color.fromRGBO(215, 217, 217, 0.612),
                            ),
                            FilterWidget(
                              title: "Escola",
                              options: getSchoolNames(),
                            ),
                            const Divider(
                              height: 50,
                              indent: 0,
                              color: Color.fromRGBO(215, 217, 217, 0.612),
                            ),
                            FilterWidget(
                              title: "Tipo de Documento",
                              options: getDocumentTypeNames(),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 90))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
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
          Positioned(
            bottom: 40,
            left: 56,
            child: SizedBox(
              width: 300,
              child: FloatingActionButton(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: const Color.fromRGBO(107, 78, 255, 1),
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BibliographicResearch()),
                        )
                      },
                  child: Text(
                    'Resultados ($numberOfResults)',
                    style: const TextStyle(
                      fontSize: 18,
                        color: Color.fromRGBO(241, 237, 237, 1)),
                  )),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }
}
