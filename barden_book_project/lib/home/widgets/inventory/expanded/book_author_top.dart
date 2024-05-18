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
          SizedBox(
            width: 880,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    book.title,
                    style: primaryFont.copyWith(
                      fontSize: 32,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
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
            padding: const EdgeInsets.only(bottom: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: bardenPurple,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
