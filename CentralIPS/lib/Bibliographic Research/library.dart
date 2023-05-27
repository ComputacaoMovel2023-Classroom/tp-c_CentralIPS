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
  late List<Book> books = List.empty(growable: true);
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
    libraryDb.limitToFirst(10).once().then((DataSnapshot snapshot) {
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
            print("opa");
          });
        } as FutureOr Function(DatabaseEvent value));
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
