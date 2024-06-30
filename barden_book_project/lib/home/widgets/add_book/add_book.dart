import 'package:barden_book_project/common/barden_close_icon.dart';
import 'package:barden_book_project/common/barden_dropdown.dart';
import 'package:barden_book_project/home/services/azure.dart';
import 'package:flutter/material.dart';

import '../../../common/barden_button.dart';
import '../../../common/barden_field.dart';
import '../../../constants.dart';

class BardenAddBook extends StatefulWidget {
  const BardenAddBook({super.key, required this.onCategoryChanged});

  final Function(String) onCategoryChanged;

  @override
  State<BardenAddBook> createState() => _BardenAddBookState();
}

class _BardenAddBookState extends State<BardenAddBook> {
  final _azure = AzureService();

  final _isbnController = TextEditingController();
  final _copiesController = TextEditingController();
  String _selectedReadingCategory = readingCategories[1];
  String _selectedReadingYear = readingYears[1];
  
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Container(
        width: 440,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: BardenIconButton(onPressed: () => Navigator.pop(context), icon: Icon(
                    Icons.close,
                    color: bardenPurple,
                    size: 20,
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  BardenField(
                    controller: _isbnController,
                    width: 240,
                    fieldName: "ISBN", 
                    onFieldChanged: () {}
                  ),
                  BardenField(
                    controller: _copiesController,
                    width: 100,
                    fieldName: "Copies", 
                    onFieldChanged: () {}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BardenDropdown(items: readingCategories, value: _selectedReadingCategory, onItemSelected: (item) {
                    setState(() {
                      _selectedReadingCategory = item;
                    });
                  }),
                  BardenDropdown(items: readingYears, value: _selectedReadingYear, onItemSelected: (item) {
                    setState(() {
                      _selectedReadingYear = item;
                    });
                  }),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BardenButton(
                  text: "ADD", 
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    var copies = int.parse(_copiesController.text);
                    var isSuccess = await _azure.addBook(_isbnController.text, _selectedReadingYear, _selectedReadingCategory, copies);

                    Navigator.pop(context);
                    _showResponseWindow(context, isSuccess);

                    setState(() {
                      _isLoading = false;
                    });
                  }, 
                  isLoading: _isLoading, 
                  width: 120
                )
              ],
            )
          ],
        ),
      ),
    ),
  );

  void _showResponseWindow(BuildContext context, bool isSuccess) async => showDialog<void>(
    context: context,
    builder: (BuildContext context) {

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 320,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BardenIconButton(icon: Icon(
                      Icons.close,
                      color: bardenPurple,
                      size: 20,
                    ), 
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                  ),
                  Center(
                    child: Text(
                      isSuccess ? "Book added successfully" : "Failed to add book",
                      style: primaryFont.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  );
}
