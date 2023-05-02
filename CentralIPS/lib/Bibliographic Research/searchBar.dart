import 'package:centralips/Bibliographic%20Research/book.dart';
import 'package:centralips/Ementas/ementasUI.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  List<Book> books = allBooks;
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
                color: Color.fromARGB(255, 217, 217, 217),
              ),
              // Use a Material design search bar
              child: TextField(
                controller: searchController,
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
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onChanged: searchBook,
              ),
            ),
            Container(
              width: 300,
              height: 500,
              child: Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return ListTile(
                      title: Text(book.name),
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookPage(book: book)),
                          ));
                },
              )),
            )
          ],
        ));
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookName = book.name.toLowerCase();
      final input = query.toLowerCase();
      return bookName.contains(input);
    }).toList();

    setState(() {
      books = suggestions;
    });
  }
}
