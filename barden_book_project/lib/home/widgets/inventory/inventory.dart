import 'package:barden_book_project/common/barden_field.dart';
import 'package:barden_book_project/constants.dart';
import 'package:barden_book_project/home/models/book.dart';
import 'package:barden_book_project/home/widgets/inventory/book_item.dart';
import 'package:barden_book_project/common/barden_button.dart';
import 'package:barden_book_project/home/widgets/inventory/expanded/book_author_top.dart';
import 'package:flutter/material.dart';

import 'book_search_bar.dart';


class BardenInventory extends StatefulWidget {
  const BardenInventory({super.key, required this.books});

  final List<Book> books;

  @override
  State<BardenInventory> createState() => _BardenInventoryState();
}

class _BardenInventoryState extends State<BardenInventory> {
  bool isHovering = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        _buildBookList(widget.books),
        _buildBookList(widget.books),
        _buildBookList(widget.books),
        _buildBookList(widget.books),
        _buildBookList(widget.books),
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
          child: books[index].isVisible ? BookItem(book: books[index], onBookTap: () {
            _showBookDetails(context, books[index]);
          }) : const SizedBox(),
        ),
      ),
    ),
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

              // more content here

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