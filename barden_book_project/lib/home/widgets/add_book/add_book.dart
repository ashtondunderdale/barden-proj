import 'package:barden_book_project/common/barden_close_icon.dart';
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
  final _yearController = TextEditingController();
  String _dropdownValue = readingCategories.first;
  
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
            BardenField(
              controller: _isbnController,
              width: 240,
              fieldName: "ISBN", 
              onFieldChanged: () {}
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: DropdownButton<String>(
                      value: _dropdownValue,
                      onChanged: (val) {
                        widget.onCategoryChanged(val!);    
                        setState(() => _dropdownValue = val );
                      },
                      items: readingCategories.map((e) => DropdownMenuItem<String>(
                        value: e, child: Text(e)
                      )).toList(),
                      style: primaryFont.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    )
                  ),
                ),
                BardenField(
                  controller: _yearController,
                  width: 100,
                  fieldName: "Year", 
                  onFieldChanged: () {}
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BardenButton(
                  text: "ADD", 
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });

                    _azure.addNewBook(_isbnController.text, _yearController.text, _dropdownValue);

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
}
