
import 'package:firebase_database/firebase_database.dart';
import 'book.dart';

/**
 * Data structure with is a list of Books
 * [books] - list of books
 */
class Library {
  List<Book> books = [];
  DatabaseReference libraryDb = FirebaseDatabase.instance.ref("library");

  Library();

  void addBookToDatabase(Book book) {
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
