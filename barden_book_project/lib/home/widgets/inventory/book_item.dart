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
          width: 160, height: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            border: widget.book.coverUrl != "Unknown" ? Border.all(color: Colors.grey) : null,
            borderRadius: widget.book.coverUrl != "Unknown" ? BorderRadius.circular(4) : null,
            boxShadow: [
              widget.book.coverUrl != "Unknown" ? BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 0),
              ) : const BoxShadow()
            ],
          ),
          child: widget.book.coverUrl != "Unknown" ? Image.network(
            widget.book.coverUrl,
            fit: BoxFit.cover,
          ) : const Icon(
            Icons.image_not_supported,
            color: Colors.grey,
            size: 48,
          ),
        ),
      ),
    );
  }
}
