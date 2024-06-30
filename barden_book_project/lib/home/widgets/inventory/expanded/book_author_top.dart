import 'package:barden_book_project/common/barden_close_icon.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../models/book.dart';

class BookAuthorTop extends StatelessWidget {
  const BookAuthorTop({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 8, left: 16),
    child: SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Tooltip(
                      message: book.title,
                      child: Text(
                        book.title,
                        style: primaryFont.copyWith(
                          fontSize: 28,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Text(
                    book.author,
                    style: primaryFont.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 16),
            child: BardenIconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: bardenPurple,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
