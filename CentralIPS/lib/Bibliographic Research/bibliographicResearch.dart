
import 'package:centralips/Bibliographic%20Research/filterResearch.dart';
import 'package:centralips/Bibliographic%20Research/searchBar.dart';
import 'package:centralips/Cubit/index_cubit.dart';
import 'package:centralips/Sidebar/NavBar.dart';
import 'package:centralips/footer_menu/footer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Esta Widget é o widget mãe da biblioteca
class BibliographicResearch extends StatefulWidget {
  const BibliographicResearch({Key? key}) : super(key: key);

  @override
  State<BibliographicResearch> createState() => BibliographicResearchState();
}

class BibliographicResearchState extends State<BibliographicResearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bibliotecaEstante.jpeg'),
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
            child: Container(
              padding: const EdgeInsets.only(
                  top: 35, left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: const[
                       Padding(padding: EdgeInsets.only(left: 10)),
                       Text(
                        "Biblioteca",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SearchBar(),
                ],
              ),
            ),
          ),
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
          Positioned(
            //Butão Filtos
            top: 270,
            right: 30,
            child: SizedBox(
              width: 150,
              height: 30,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                    value: context.read<FooterMenuCubit>(),
                                    child: const FilterResearch(),
                                  )),
                        )
                      },
                  child: const Text(
                    'Filtros',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
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
