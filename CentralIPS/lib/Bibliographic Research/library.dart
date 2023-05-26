import '../Departamentos/school.dart';
import 'book.dart';
import 'bookCategory.dart';

/**
 * Data structure with is a list of Books
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
      name: "O Diário de um Banana 1: Edição Especial Toque do Queijo",
      urlImage:
          "https://img.bertrand.pt/images/o-diario-de-um-banana-1-edicao-especial-toque-do-queijo-jeff-kinney/NDV8MjI4NTU4NjJ8MTg3MzUzNjh8MTY1MDI3MDI3NzAwMA==/500x",
      authors: ["Jeff Kinney", "Meme"],
      school: School.esce,
      edition: "19",
      isbn: "181819299292",
      categories: [Category.accao,Category.terror]),
  Book(
      name: "Among Us - Uma História em que Tu és o Herói… ou o Vilão",
      urlImage:
          "https://img.bertrand.pt/images/among-us-uma-historia-em-que-tu-es-o-heroi-ou-o-vilao-eva-grynszpan/NDV8MjU2MzI3MDJ8MjE4ODE5NjN8MTY0NjY0MjUxODAwMHx3ZWJw/300x",
      authors: ["Eva Grynszpan"],
      school: School.esce,
      edition: "Especial",
      isbn: "9789897844461",
      categories: [Category.aventura],
      isAvailable: false),
  Book(
      name: "name3",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "1edition",
      isbn: "isbn",
      categories: [Category.accao]),
  Book(
      name: "name4",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      categories: [Category.accao]),
  Book(
      name: "name5",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      categories: [Category.accao]),
  Book(
      name: "name5",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      categories: [Category.accao]),
  Book(
      name: "name5",
      urlImage:
          "https://img.freepik.com/vetores-gratis/pilha-de-livros-de-design-plano-desenhado-a-mao_23-2149334862.jpg?w=1380&t=st=1683106455~exp=1683107055~hmac=dba422f51e05fee07a8aaa569c32097b741dbc4688aa9ac956c00fceb1acd709",
      authors: ["Luis Damas", "Paulino"],
      school: School.esce,
      edition: "edition",
      isbn: "isbn",
      categories: [Category.accao]),
];
