import '../Departamentos/school.dart';
import 'book.dart';

/**
 * Data structure with is a list of Book s
 */
class Library {
  List<Book> books = List.empty();

  Library() {
    books = allBooksTest;
  }

  void addBook(Book book) {
    books.add(book);
  }

  bool deleteBook(Book book) {
    return books.remove(book);
  }

  int size() {
    return books.length;
  }

  Book getBook(int index) {
    return books.elementAt(index);
  }
}

final allBooksTest = <Book>[
  Book(
      name: "name",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name2",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name3",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
  Book(
      name: "name4",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      category: Category.accao),
];
