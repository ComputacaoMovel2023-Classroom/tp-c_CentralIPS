import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';
import 'bookCategory.dart';

/**
 * Book data-structure
 */
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
  final List<Category> categories;
  final bool isAvailable;

  Book(
      {required this.name,
      this.urlImage = "https://bookcart.azurewebsites.net/Upload/Default_image.jpg",
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
}
