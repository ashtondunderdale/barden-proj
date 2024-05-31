import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookSearchBar extends StatelessWidget {
  const BookSearchBar({
    super.key, 
    required this.controller, 
    required this.onSearch,
    required this.books
  });

  final TextEditingController controller;
  final Function(String) onSearch;
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Search..."
        ),
        onChanged: (text) {
          for (var book in books) {
            var title = book.title.toLowerCase()
              .replaceAll(RegExp(r'[^\w\s]+'),'');

            book.isVisible = title.contains(text.toLowerCase());
          }
          
          onSearch(text);
        },
      ),
    );
  }
}