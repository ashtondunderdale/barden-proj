import 'package:barden_book_project/constants.dart';
import 'package:barden_book_project/home/models/book.dart';
import 'package:barden_book_project/home/widgets/inventory/book_item.dart';
import 'package:barden_book_project/common/barden_button.dart';
import 'package:barden_book_project/home/widgets/inventory/expanded/book_author_top.dart';
import 'package:flutter/material.dart';

import '../top_title_bar.dart';


class BardenInventory extends StatefulWidget {
  const BardenInventory({super.key, required this.books});

  final List<Book> books;

  @override
  State<BardenInventory> createState() => _BardenInventoryState();
}

class _BardenInventoryState extends State<BardenInventory> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const TopTitleBar(activeAction: "Inventory"),
          ...{
            "EYFS": "EYFS",
            "1": "Year 1",
            "2": "Year 2",
            "3": "Year 3",
            "4": "Year 4",
            "5": "Year 5",
            "6": "Year 6",
          }.entries.map((entry) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildBookList(
              widget.books.where((book) => book.readingYear == entry.key).toList(),
              entry.value,
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildBookList(List<Book> books, String title) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: primaryFont.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 48
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: books[index].isVisible ? BookItem(book: books[index], onBookTap: () {
                _showBookDetails(context, books[index]);
              }) : const SizedBox(),
            ),
          ),
        ),
      ),
    ],
  );

  void _showBookDetails(BuildContext context, Book book) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) => Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
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
              BookAuthorTop(book: book),

              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  book.isbn,
                  style: primaryFont.copyWith(
                    color: Colors.grey,
                    fontSize: 12            
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  book.category,
                  style: primaryFont.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Reading Year: ${book.readingYear}",
                  style: primaryFont.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Release Year: ${book.releaseYear}",
                  style: primaryFont.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  "Copies: ${book.numberOfCopies}",
                  style: primaryFont.copyWith(
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
      ),
    ),
  );
}