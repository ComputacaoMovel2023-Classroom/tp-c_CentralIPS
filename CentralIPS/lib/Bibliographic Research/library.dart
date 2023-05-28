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
  DatabaseReference libraryDb = FirebaseDatabase.instance.ref("library");

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
}
