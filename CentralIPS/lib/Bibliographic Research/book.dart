import 'package:centralips/Departamentos/school.dart';

import 'bookCategory.dart';

/// Book data-structure
class Book {
  String name = 'Sem título';
  final String urlImage;
  final List<String> authors;
  final School school;
  final String synopsis;
  final String edition;
  final String isbn;
  final String language;
  final int numberOfPages;
  final List<BookCategory> categories;
  final bool isAvailable;

  Book(
      {required this.name,
      this.urlImage =
          "https://bookcart.azurewebsites.net/Upload/Default_image.jpg",
      required this.authors,
      required this.school,
      required this.synopsis,
      required this.edition,
      required this.isbn,
      required this.language,
      required this.numberOfPages,
      required this.categories,
      this.isAvailable = true});

  String showAuthors() {
    String toReturn = '';
    for (String author in authors) {
      toReturn += "$author\n";
    }
    return toReturn;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'urlImage': urlImage,
      'authors': authors,
      'school': school.toString(),
      'synopsis': synopsis,
      'edition': edition,
      'isbn': isbn,
      'language': language,
      'numberOfPages': numberOfPages,
      'categories': categories.map((category) => category.toString()).toList(),
      'isAvailable': isAvailable,
    };
  }

  //to string
  String infoBook() {
    return "Book: $name\nAuthors: ${showAuthors()}\nSchool: ${school.name}\nSynopsis: $synopsis\nEdition: $edition\nISBN: $isbn\nLanguage: $language\nNumber of pages: $numberOfPages\nCategories: ${categories.toString()}\nIs available: $isAvailable";
  }
}
