import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../Departamentos/school.dart';
import 'book.dart';
import 'bookCategory.dart';

/**
 * Data structure with is a list of Books
 */
class Library {
  List<Book> books = [];
  final DatabaseReference libraryDb = FirebaseDatabase.instance.ref("library");

  Library();

  void addBook(Book book) {
    libraryDb.push().set(book.toJson());
  }

  bool deleteBook(Book book) {
    return books.remove(book);
  }

  int size() {
    return books.length;
  }

  Book getBook(int index) {
    return books[index];
  }

  void fetchData() {
    libraryDb.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      var bookData = snapshot.value as Map;

      bookData.forEach(
        (key, value) {
          var bookMap = value as Map;
          String name = '';
          String urlImage = '';
          List<String> authors = [];
          School school = School.na;
          String synopsis = '';
          String edition = '';
          String isbn = '';
          String language = '';
          int numberOfPages = 0;
          List<Category> categories = [];
          bool isAvailable = false;

          bookMap.forEach((key, value) {
            if (key == 'isAvailable') {
              isAvailable = value;
              print(isAvailable);
            } else if (key == 'numberOfPages') {
              numberOfPages = value;
              print(numberOfPages);
            } else if (key == 'school') {
              school = getSchool(value);
              print(school);
            } else if (key == 'edition') {
              edition = value;
              print(edition);
            } else if (key == 'language') {
              language = value;
              print(language);
            } else if (key == 'name') {
              name = value;
              print(name);
            } else if (key == 'categories') {
              List aux = value;
              aux.forEach((element) {
                categories.add(getCategory(element.toString()));
              });
              print(categories); 
            } else if (key == 'synopsis') {
              synopsis = value;
              print(synopsis);
            } else if (key == 'authors') {
              List aux = value;
              aux.forEach((element) {
                authors.add(element.toString());
              });
              print(authors);
            } else if (key == 'urlImage') {
              urlImage = value;
              print(urlImage);
            }
            Book book = Book(
                name: name,
                authors: authors,
                school: school,
                synopsis: synopsis,
                edition: edition,
                isbn: isbn,
                language: language,
                numberOfPages: numberOfPages,
                categories: categories);
            books.add(book);
          });
        },
      );
    });
    /* libraryDb.limitToFirst(10).once().then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;

          data.forEach((key, value) {
            String name = value['name'];
            String urlImage = value['urlImage'];
            List<String> authors = value['authors'];
            School school = value['school'];
            String synopsis = value['synopsis'];
            String edition = value['synopsis'];
            String isbn = value['isbn'];
            String language = value['language'];
            int numberOfPages = value['numberOfPages'];
            List<Category> categories = value['categories'];
            bool isAvailable = value['isAvailable'];

            Book book = Book(
                name: name,
                urlImage: urlImage,
                authors: authors,
                school: school,
                synopsis: synopsis,
                edition: edition,
                isbn: isbn,
                language: language,
                numberOfPages: numberOfPages,
                categories: categories,
                isAvailable: isAvailable);

            books.add(book);
          });
        } as FutureOr Function(DatabaseEvent value)); */
  }

  void teste() {
    print("OPA");
    Book book1 = Book(
        name: "O Diário de um Banana 1: Edição Especial Toque do Queijo",
        urlImage:
            "https://img.bertrand.pt/images/o-diario-de-um-banana-1-edicao-especial-toque-do-queijo-jeff-kinney/NDV8MjI4NTU4NjJ8MTg3MzUzNjh8MTY1MDI3MDI3NzAwMA==/500x",
        authors: ["Jeff Kinney", "Meme"],
        school: School.ests,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "19",
        isbn: "181819299292",
        language: "Português",
        numberOfPages: 123,
        categories: [
          Category.accao,
          Category.terror,
          Category.aventura,
          Category.conto,
          Category.biografias,
          Category.romances
        ]);
    addBook(book1);

    Book book2 = Book(
        name: "Among Us - Uma História em que Tu és o Herói… ou o Vilão",
        urlImage:
            "https://img.bertrand.pt/images/among-us-uma-historia-em-que-tu-es-o-heroi-ou-o-vilao-eva-grynszpan/NDV8MjU2MzI3MDJ8MjE4ODE5NjN8MTY0NjY0MjUxODAwMHx3ZWJw/300x",
        authors: ["Eva Grynszpan"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "Especial",
        isbn: "9789897844461",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.aventura],
        isAvailable: false);
    addBook(book2);

    Book book3 = Book(
        name: "name3",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "1edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]);
    addBook(book3);
  }

  final allBooksTest = <Book>[
    Book(
        name: "O Diário de um Banana 1: Edição Especial Toque do Queijo",
        urlImage:
            "https://img.bertrand.pt/images/o-diario-de-um-banana-1-edicao-especial-toque-do-queijo-jeff-kinney/NDV8MjI4NTU4NjJ8MTg3MzUzNjh8MTY1MDI3MDI3NzAwMA==/500x",
        authors: ["Jeff Kinney", "Meme"],
        school: School.ests,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "19",
        isbn: "181819299292",
        language: "Português",
        numberOfPages: 123,
        categories: [
          Category.accao,
          Category.terror,
          Category.aventura,
          Category.conto,
          Category.biografias,
          Category.romances
        ]),
    Book(
        name: "Among Us - Uma História em que Tu és o Herói… ou o Vilão",
        urlImage:
            "https://img.bertrand.pt/images/among-us-uma-historia-em-que-tu-es-o-heroi-ou-o-vilao-eva-grynszpan/NDV8MjU2MzI3MDJ8MjE4ODE5NjN8MTY0NjY0MjUxODAwMHx3ZWJw/300x",
        authors: ["Eva Grynszpan"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "Especial",
        isbn: "9789897844461",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.aventura],
        isAvailable: false),
    Book(
        name: "name3",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "1edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]),
    Book(
        name: "name4",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]),
    Book(
        name: "name5",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]),
    Book(
        name: "name5",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]),
    Book(
        name: "name5",
        authors: ["Luis Damas", "Paulino"],
        school: School.esce,
        synopsis: "fjnaijfnaskjfnakjs jnfakjfnkjafnd\nkjnaksjfkjjd",
        edition: "edition",
        isbn: "isbn",
        language: "Português",
        numberOfPages: 123,
        categories: [Category.accao]),
  ];
}
