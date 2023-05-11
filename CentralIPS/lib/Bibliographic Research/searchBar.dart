import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Departamentos/school.dart';
import 'package:centralips/Ementas/ementasUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import 'bookPage.dart';
import 'library.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  Library library = Library();
  String result = "";
  @override
  Widget build(BuildContext context) {
    // This controller will store the value of the search bar
    final TextEditingController searchController = TextEditingController();
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
                  hintText: 'Livros, isbn, autor',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      searchBook(searchController.text);
                      // TODO manter a pesquisa na caixa de pesquisa
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 50)),
            const Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 420,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: library.size(),
                itemBuilder: (context, index) {
                  final book = library.getBook(index);
                  return Card(
                      elevation: 4, // Controls the shadow depth
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Sets the shape of corners
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      surfaceTintColor: Colors.white,
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                    value: context.read<FooterMenuCubit>(),
                                    child: BookPage(book: book))),
                          )
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 100,
                                  child: Image.network(
                                    book.urlImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: 221,
                                      child: Text(
                                        book.name,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.account_circle_rounded,
                                                  size: 18,
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Text(
                                                    "${book.authors.elementAt(0)}"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  size: 18,
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5)),
                                                Text(book.school
                                                    .displayString()),
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }

  void searchBook(String query) {
    final suggestions = allBooksTest.where((book) {
      final bookName = book.name.toLowerCase();
      final input = query.toLowerCase();
      return bookName.contains(input);
    }).toList();

    setState(() {
      library.books = suggestions;
    });
  }
}
