import 'package:flutter/material.dart';

class BookSearchBar extends StatelessWidget {
  const BookSearchBar({super.key, required this.controller, required this.onSearch});

  final TextEditingController controller;
  final Function(String) onSearch;

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
          onSearch(text);
        },
      ),
    );
  }
}