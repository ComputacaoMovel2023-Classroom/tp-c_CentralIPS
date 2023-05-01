import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchBar> {
  String searchValue = '';
  final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          EasySearchBar(
          title: const Text('Example'),
          onSearch: (value) => setState(() => searchValue = value),
          suggestions: _suggestions,
          
        ),
        
    ]);
      
    
  }
}
