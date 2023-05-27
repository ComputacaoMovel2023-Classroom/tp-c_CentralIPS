import 'package:centralips/Departamentos/school.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/index_cubit.dart';
import 'book.dart';
import 'bookCategory.dart';
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
  bool loadedData = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    /* final user = FirebaseAuth.instance.currentUser;
    FirebaseDatabase.instance
        .ref()
        .child('library')
        .child(user!.uid)
        .onValue
        .listen((event) {
      // Get the snapshot of the data
      DataSnapshot snapshot = event.snapshot;

      var userData = snapshot.value as Map;
     
      setState(() {
        loadedData = true;
        
      });
    }); */
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
                  hintText: 'Livros, isbn, autor',
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
            (library.size() > 0)
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
                                        Container(
                                          width: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              book.urlImage,
                                              fit: BoxFit.cover,
                                            ),
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
                                                          Text(book.school
                                                              .displayString()),
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
                        Padding(padding: EdgeInsets.only(top: 35)),
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
    final suggestions = library.books.where((book) {
      final bookName = book.name.toLowerCase();
      final input = query.toLowerCase();
      return bookName.contains(input);
    }).toList();

    setState(() {
      library.books = suggestions;
    });
  }
}
