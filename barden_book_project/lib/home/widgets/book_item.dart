import 'package:flutter/material.dart';

import '../models/book.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 150,
      child: Text(
        book.title
      ),
    );
  }
}