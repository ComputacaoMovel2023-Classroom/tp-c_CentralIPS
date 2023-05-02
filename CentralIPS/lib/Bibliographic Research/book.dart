import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

enum Category { accao, aventura, biografias, conto, drama, romances, terror }

class Book {
  final String name;
  final String image;
  final String authors;
  final School school;
  final String edition;
  final String isbn;
  final Category category;

  Book(this.name, this.image, this.authors, this.school, this.edition,
      this.isbn, this.category);
}

var allBooks = [
  Book("name", "image", "authors", School.esce, "edition", "isbn",
      Category.accao),
  Book("name2", "image", "authors", School.esce, "edition", "isbn",
      Category.accao),
  Book("name3", "image", "authors", School.esce, "edition", "isbn",
      Category.accao),
  Book("name4", "image", "authors", School.esce, "edition", "isbn",
      Category.accao),
];

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({
    Key? key,
    required this.book,
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
                image: AssetImage('assets/images/chairsips.png'),
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
            margin: EdgeInsets.only(top: 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children:  [
                  const SizedBox(height: 10, width: 400),
                  Text(
                    book.name ?? 'Sem título',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Horário de Funcionamento",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "12h-15h",
                    style: TextStyle(fontSize: 16),
                  ),

                  //EmentasList(),
                ],
              ),
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
