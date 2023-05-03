import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

enum Category { accao, aventura, biografias, conto, drama, romances, terror }

class Book {
  String name = 'Sem título';
  final String urlImage;
  final List authors;
  final School school;
  final String edition;
  final String isbn;
  final Category category;

  Book(
      {required this.name,
      required this.urlImage,
      required this.authors,
      required this.school,
      required this.edition,
      required this.isbn,
      required this.category});
}



var allBooks = [
  

  Book(
      name: "name",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas","Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name2",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas","Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name3",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas","Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name4",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas","Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
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
                children: [
                  const SizedBox(height: 10, width: 400),
                  Text(
                    book.name,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network(book.urlImage, fit: BoxFit.cover, width: double.infinity, height: 300,),
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
