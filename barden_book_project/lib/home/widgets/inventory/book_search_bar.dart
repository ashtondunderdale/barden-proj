import 'package:barden_book_project/constants.dart';
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
  Widget build(BuildContext context) => Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: SizedBox(
          width: 300, height: 40,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: primaryFont,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
            ),
            
            onChanged: (text) {
        
              for (var book in books) {
                var title = book.title.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'),'');
                var author = book.author.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'),'');
      
                book.isVisible = title.contains(text) || author.contains(text);
              }
              
              onSearch(text);
            },
          ),
        ),
      ),
    ],
  );
}