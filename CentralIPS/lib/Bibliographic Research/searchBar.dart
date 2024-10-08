import 'dart:developer';
import 'package:centralips/Bloc/libraryFilters/library_filters_bloc.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import 'book.dart';
import 'bookCategory.dart';
import 'bookPage.dart';
import 'library.dart';

/// Widget that contains the search bar and the books that should be displayed
class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  Library library = Library();
  DatabaseReference libraryDb = FirebaseDatabase.instance.ref("library");
  String result = "";
  bool loadedData = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData('');
  }

  @override
  Widget build(BuildContext context) {
    // This controller will store the value of the search bar
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromARGB(255, 217, 217, 217),
              ),
              // Use a Material design search bar
              child: TextField(
                controller: searchController,
                onSubmitted: (value) => searchBook(value),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  hintText: 'Qual o nome do livro?',
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      searchBook(searchController.text);
                    },
                  ),
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => searchController.clear(),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            const Divider(
              color: Colors.black,
            ),
            (library.size() > 0 && loadedData)
                ? SizedBox(
                    height: 420,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: library.size(),
                      itemBuilder: (context, index) {
                        final book = library.getBook(index);
                        return Stack(
                          children: [
                            Card(
                                elevation: 4, // Controls the shadow depth
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Sets the shape of corners
                                ),
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                surfaceTintColor: Colors.white,
                                child: InkWell(
                                  onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BlocProvider.value(
                                              value: context
                                                  .read<FooterMenuCubit>(),
                                              child: BookPage(book: book))),
                                    )
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                                image: NetworkImage((book
                                                            .urlImage ==
                                                        '')
                                                    ? "https://bookcart.azurewebsites.net/Upload/Default_image.jpg"
                                                    : book.urlImage)),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  book.name,
                                                  style: const TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                  softWrap: true,
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .account_circle_rounded,
                                                            size: 18,
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Text(
                                                            book.authors
                                                                .elementAt(0),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.location_on,
                                                            size: 18,
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5)),
                                                          Text(
                                                              book.school.name),
                                                        ],
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 15,
                                right: 10,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: book.isAvailable
                                        ? const Color.fromRGBO(9, 131, 72, 1)
                                        : const Color.fromRGBO(216, 30, 41,
                                            1), // Replace with your custom color
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      // Handle button tap
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 8,
                                    ),
                                  ),
                                ))
                          ],
                        );
                      },
                    ),
                  )
                : Container(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Wrap(
                              children: [
                                Text(
                                  "A sua pesquisa - '${searchController.text}' - não encontrou nenhum documento.",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Sugestões:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                  " • Certefique-se de que nenhuma palavra contem erros ortográficos.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 8)),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                  " • Tente utilizar outras palavras-chave",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 35)),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/happyBook.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ));
  }

  void searchBook(String query) {
    setState(() {
      loadedData = false;
    });

    _fetchData(query);
    setState(() {
      loadedData = true;
    });
  }

  Future<void> _fetchData(String nameContains) async {
    LibraryFiltersBloc libraryFiltersBloc =
        BlocProvider.of<LibraryFiltersBloc>(context);

    libraryDb.onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;

      var bookData = snapshot.value as Map;

      Library auxLibrary = Library();
      //for each book
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
          List<BookCategory> categories = [];
          bool isAvailable = false;

          if (value['name']
              .toString()
              .toUpperCase()
              .contains(nameContains.toUpperCase())) {
            //for each book atributes
            bookMap.forEach((key, value) {
              if (key == 'isAvailable') {
                isAvailable = value;
                //print(isAvailable);
              } else if (key == 'numberOfPages') {
                numberOfPages = value;
                //print(numberOfPages);
              } else if (key == 'school') {
                school = getSchool(value);
                //print(school);
              } else if (key == 'edition') {
                edition = value;
                //print(edition);
              } else if (key == 'language') {
                language = value;
                //print(language);
              } else if (key == 'name') {
                name = value;
                //print(name);
              } else if (key == 'categories') {
                List aux = value;
                for (var element in aux) {
                  categories.add(getCategory(element.toString()));
                }
                //print(categories);
              } else if (key == 'synopsis') {
                synopsis = value;
                //print(synopsis);
              } else if (key == 'authors') {
                List aux = value;
                for (var element in aux) {
                  authors.add(element.toString());
                }
                //print(authors);
              } else if (key == 'urlImage') {
                urlImage = value as String;
                //print(urlImage);
              } else if (key == 'isbn') {
                isbn = value;
              }
            });
            Book book = Book(
                name: name,
                authors: authors,
                urlImage: urlImage,
                school: school,
                synopsis: synopsis,
                edition: edition,
                isbn: isbn,
                isAvailable: isAvailable,
                language: language,
                numberOfPages: numberOfPages,
                categories: categories);

            if (!libraryFiltersBloc.libraryFilter.performFilterSearch) {
              log("LIVRO ADICIONADO");
              auxLibrary.books.add(book);
            } else {
              searchWithCategories(libraryFiltersBloc, book, auxLibrary);
            }
          }
        },
      );
      libraryFiltersBloc.libraryFilter =
          libraryFiltersBloc.libraryFilter.copyWith(performFilterSearch: false);

      library = auxLibrary;
      setState(() {
        loadedData = true;
      });
    });
  }

  void searchWithCategories(
      LibraryFiltersBloc libraryFiltersBloc, Book book, Library library) {
    final isAvailable = libraryFiltersBloc.libraryFilter.isAvailable;

    if (book.isAvailable != isAvailable) return;

    final categoriesFilter = libraryFiltersBloc.libraryFilter.categoriesFilter
        .where((element) => element.isEnabled)
        .map((e) => e.category)
        .toList();

    if (categoriesFilter.isEmpty) {
      log("LIVRO FILTRADO");
      library.books.add(book);
      return;
    }

    if (book.categories.toSet().intersection(categoriesFilter.toSet()).isEmpty) return;

    log("LIVRO FILTRADO");
    library.books.add(book);
  }
}
