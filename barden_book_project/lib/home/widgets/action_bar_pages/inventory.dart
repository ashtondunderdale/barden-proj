import 'package:barden_book_project/home/models/book.dart';
import 'package:flutter/material.dart';


class BardenInventory extends StatelessWidget {
  BardenInventory({super.key});

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
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildBookItem(context, index, books[index])
        ),
      ),
    ),
  );

  Widget _buildBookItem(BuildContext context, int index, Book book) => GestureDetector(
    onTap: () {
      _showMyDialog(context, book);
    },
    child: Container(
      width: 160,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey)
      ),
      child: Text(
        book.title
      )
    ),
  );
}

void _showMyDialog(BuildContext context, Book book) async => showDialog<void>(
  context: context,
  builder: (BuildContext context) => Container(
    width: 400,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      book.title
    ),
  )
);
