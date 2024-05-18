import 'package:barden_book_project/constants.dart';
import 'package:barden_book_project/home/models/book.dart';
import 'package:barden_book_project/home/widgets/inventory/book_item.dart';
import 'package:barden_book_project/common/barden_button.dart';
import 'package:flutter/material.dart';


class BardenInventory extends StatefulWidget {
  const BardenInventory({super.key});

  @override
  State<BardenInventory> createState() => _BardenInventoryState();
}

class _BardenInventoryState extends State<BardenInventory> {
  final List<Book> books = [
    Book(title: "title 1", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 2", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 3", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 4", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 5", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 6", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 7", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 8", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 9", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 10", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 11", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
    Book(title: "title 12", author: "author 1", 
    numberAvailable: 1, isbn: "32-4342-3-423", 
    level: ReadingLevel.beginner, publicationYear: "2022"),
  ];

  bool isHovering = false;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        _buildBookList(books),
        _buildBookList(books),
        _buildBookList(books),
        _buildBookList(books),
        _buildBookList(books),
      ],
    ),
  );

  Widget _buildBookList(List<Book> books) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 240,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookItem(book: books[index], onBookTap: () {
            _showBookDetails(context, books[index]);
          })
        ),
      ),
    ),
  );

  void _showBookDetails(BuildContext context, Book book) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) => Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                book.title,
                style: primaryFont.copyWith(
                  fontSize: 32,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BardenButton(
                  text: "SAVE", 
                  onPressed: () {

                  }, 
                  isLoading: false, 
                  width: 120
                )
              ],
            )
          ],
        ),
      ),
    )
  );
}