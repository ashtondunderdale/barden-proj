import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

import '../../models/book.dart';

class BookItem extends StatefulWidget {
  const BookItem({super.key, required this.book, required this.onBookTap});

  final Book book;
  final VoidCallback onBookTap;

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => isHovering = true );
      },
      onExit: (_) {
        setState(() => isHovering = false );
      },
      child: GestureDetector(
        onTap: () {
          widget.onBookTap();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.identity().scaled(isHovering ? 1.05 : 1),
          transformAlignment: Alignment.center,
          width: 160, height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: const Center(
            child: Text(
              "book image here"
            ),
          ),
        ),
      ),
    );
  }
}
