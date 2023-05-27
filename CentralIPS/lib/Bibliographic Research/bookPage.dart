import 'package:centralips/Bibliographic%20Research/bookCategory.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';
import 'bibliographicResearch.dart';
import 'book.dart';

class BookPage extends StatelessWidget {
  final Book book;
  BookPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> authors = [];
    for (String author in book.authors) {
      authors.add(author);
    }
    for (Category category in book.categories) {}
    return Scaffold(
      body: SingleChildScrollView(
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
              margin: const EdgeInsets.only(top: 140),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 180, left: 20, right: 20, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      book.name,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      indent: 0,
                      endIndent: 0,
                      height: 40,
                    ),
                    Card(
                      elevation: 4, // Controls the shadow depth
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Sets the shape of corners
                      ),
                      color: const Color.fromRGBO(239, 239, 239, 1),
                      surfaceTintColor: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: AlignmentDirectional.topStart,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.account_circle_rounded,
                                      size: 18,
                                    ),
                                    Text(
                                      "Autor/Autores",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: book.authors.length,
                                  itemBuilder: (context, index) {
                                    String text = book.authors[index];
                                    return textWithDotLeader(text, 1);
                                  },
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.location_on,
                                      size: 18,
                                    ),
                                    Text(
                                      "Escola",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 20)),
                                    Text(
                                      book.school.displayString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: const Text(
                        "Sinopse",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      elevation: 4, // Controls the shadow depth
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Sets the shape of corners
                      ),
                      color: const Color.fromRGBO(239, 239, 239, 1),
                      surfaceTintColor: Colors.white,
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          alignment: AlignmentDirectional.topStart,
                          child: Wrap(
                            children: [
                              Text(
                                book.synopsis,
                                style: const TextStyle(fontSize: 17),
                              )
                            ],
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: const Text(
                        "Info Adicional",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Card(
                      elevation: 4, // Controls the shadow depth
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Sets the shape of corners
                      ),
                      color: const Color.fromRGBO(239, 239, 239, 1),
                      surfaceTintColor: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: AlignmentDirectional.topStart,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Edição:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      '${book.edition}ª edição',
                                      style: const TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    const Text(
                                      "ISBN:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      book.isbn,
                                      style: const TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: const Text(
                                        "Categorias:",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Wrap(
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              book.categories
                                                  .map((category) => category
                                                      .name
                                                      .split('.')
                                                      .last)
                                                  .join(', '),
                                              style:
                                                  const TextStyle(fontSize: 17),
                                              maxLines: 2,
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    const Text(
                                      "Idioma:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      book.language,
                                      style: const TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    const Text(
                                      "Páginas:",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text(
                                      "${book.numberOfPages}",
                                      style: const TextStyle(fontSize: 17),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: screenWidth * 0.325,
              child: Container(
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Image.network(
                  book.urlImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 130,
                right: -20,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: book.isAvailable
                          ? const Color.fromRGBO(9, 131, 72, 1)
                          : const Color.fromRGBO(216, 30, 41, 1)),
                  child: Row(
                    children: [
                      Icon(
                        book.isAvailable ? Icons.check_circle : Icons.close,
                        color: Colors.white,
                      ),
                      Text(
                        book.isAvailable ? 'Disponível' : 'Indisponível',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
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
                      onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                        value: context.read<FooterMenuCubit>(),
                                        child: const BibliographicResearch(),
                                      )),
                            )
                          },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ));
                }),
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      drawer: const NavBar(),
      bottomNavigationBar: BottomNavigationExample(),
    );
  }

  String buildDotLeader(int length) {
    const dot = '    •';
    return List<String>.filled(length, dot).join();
  }

  Text textWithDotLeader(String text, int dotLeaderLength) {
    return Text.rich(
      TextSpan(
        text: buildDotLeader(dotLeaderLength),
        style: const TextStyle(fontSize: 17, color: Colors.black),
        children: [
          TextSpan(text: ' $text'),
        ],
      ),
    );
  }
}
