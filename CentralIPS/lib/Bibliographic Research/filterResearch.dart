import 'package:centralips/Bibliographic%20Research/bibliographicResearch.dart';
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

//- TODO repar o overflow e adcionar scroll
class FilterResearchState extends State<FilterResearch> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      body: Column(
        children: [
          Stack(
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
                      SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 10),
                          child: Column(
                            children: [
                              FilterWidget(
                                title: "Área",
                                options: const ["Campo1", "Campo2"],
                              ),
                              FilterWidget(
                                title: "Escola",
                                options: getSchoolNames(),
                              ),
                              FilterWidget(
                                title: "Tipo de Documento",
                                options: const [
                                  "Analítico",
                                  "Ficção",
                                  "Monografia",
                                  "Relatório",
                                  "Teses",
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                  left: 0,
                  bottom: 128,
                  right: 0,
                  child: BottomNavigationExample()),
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
        ],
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      backgroundColor: Colors.transparent,
    );
  }
}
