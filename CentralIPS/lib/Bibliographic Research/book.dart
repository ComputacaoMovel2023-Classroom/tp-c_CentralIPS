import 'package:centralips/Departamentos/school.dart';
import 'package:flutter/material.dart';

import '../Sidebar/NavBar.dart';
import '../footer_menu/footer_menu.dart';

/**
 * Book category
 */
enum Category { accao, aventura, biografias, conto, drama, romances, terror }

/**
 * Book data-structure
 */
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
