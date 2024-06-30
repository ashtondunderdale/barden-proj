import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:file_saver/file_saver.dart';

import 'package:barden_book_project/common/barden_close_icon.dart';
import 'package:barden_book_project/common/barden_dropdown.dart';
import 'package:barden_book_project/data.dart';
import 'package:barden_book_project/home/widgets/inventory/book_search_bar.dart';
import 'package:flutter/material.dart';
import '../../../common/barden_button.dart';
import '../../../constants.dart';
import '../../../login/views/login.dart';
import '../../models/book.dart';

class InventoryTitleBar extends StatefulWidget {
  const InventoryTitleBar({
    super.key,
    required this.activeAction, 
    required this.onReadingCategorySelected, 
    required this.onReadingYearSelected, 
    required this.onFiltersCleared,
    required this.searchController,
    required this.books,
    required this.onSearch
  });

  final String activeAction;
  final Function(String) onReadingCategorySelected;
  final Function(String) onReadingYearSelected;
  final VoidCallback onSearch;

  final VoidCallback onFiltersCleared;
  final TextEditingController searchController;
  final List<Book> books;

  @override
  State<InventoryTitleBar> createState() => _InventoryTitleBarState();
}

class _InventoryTitleBarState extends State<InventoryTitleBar> {

  @override
  Widget build(BuildContext context) => Row(
    children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width - 240,
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Text(
                  widget.activeAction,
                  style: primaryFont.copyWith(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              BardenDropdown(items: readingCategories, value: selectedCategoryTag, onItemSelected: (item) {
                widget.onReadingCategorySelected(item);
              }), 
              BardenDropdown(items: readingYears, value: selectedYearTag, onItemSelected: (item) {
                widget.onReadingYearSelected(item);
              }), 
              BardenButton(text: "Clear Filters", isLoading: false, width: 150, onPressed: () {
                widget.onFiltersCleared();
                setState(() {
                  widget.searchController.clear();
                });
              }),
              BookSearchBar(controller: widget.searchController, books: widget.books, onSearch:(text) {
                widget.onSearch();
              }),
              BardenButton(text: "Export", isLoading: false, width: 120, onPressed: () {
                _showExport(context);
              })
            ],
          ),
        ),
      ),
      BardenButton(
        width: 100,
        text: "LOGOUT", 
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        }, 
        isLoading: false
      )
    ],
  );

  void _showExport(BuildContext context) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      String exportCategory = readingCategories.first;
      String exportYear = readingYears.first;

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                width: 600,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Export as CSV",
                            style: primaryFont.copyWith(
                              color: const Color.fromARGB(255, 58, 58, 58),
                              fontSize: 32,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24, right: 8),
                          child: BardenIconButton(icon: Icon(
                            Icons.close,
                            color: bardenPurple,
                            size: 20,
                          ), 
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        BardenDropdown(items: readingCategories, value: exportCategory, onItemSelected: (item) {
                          setState(() {
                            exportCategory = item;
                          });
                        }),
                        BardenDropdown(items: readingYears, value: exportYear, onItemSelected: (item) {
                          setState(() {
                            exportYear = item;
                          });
                        }),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BardenButton(
                        text: "Export", 
                        isLoading: false, 
                        width: 120, 
                        onPressed: () {
                          List<Book> filteredBooks = [];

                          for (var book in widget.books) {
                            if (book.readingYear == exportYear && book.category == exportCategory) {
                              filteredBooks.add(book);
                            }
                          }

                          List<List<dynamic>> cols = [];
                          cols.add([
                            "Title", 
                            "Author", 
                            "ISBN", 
                            "Cover URL", 
                            "Category", 
                            "Lexile Level", 
                            "Publisher", 
                            "Reading Year", 
                            "Release Year", 
                            "Language", 
                            "BL Score", 
                            "Number of Copies",
                          ]);

                          for (var book in filteredBooks) {
                            List<dynamic> row = [];

                            row.add(book.title);
                            row.add(book.author);
                            row.add(book.isbn.toString());
                            row.add(book.coverUrl);
                            row.add(book.category);
                            row.add(book.lexileLevel);
                            row.add(book.publisher);
                            row.add(book.readingYear);
                            row.add(book.releaseYear);
                            row.add(book.language);
                            row.add(book.blScore);
                            row.add(book.numberOfCopies);

                            cols.add(row);
                          }

                          String csv = const ListToCsvConverter().convert(cols);
                          downloadCSV(csv);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );

  downloadCSV(String file) async {
    Uint8List bytes = Uint8List.fromList(utf8.encode(file));

    await FileSaver.instance.saveFile(
      name: 'barden_book_data',
      bytes: bytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );
  }
}
