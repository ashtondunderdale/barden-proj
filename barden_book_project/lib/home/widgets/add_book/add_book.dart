import 'package:barden_book_project/common/barden_close_icon.dart';
import 'package:barden_book_project/home/services/blob.dart';
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
  final _blob = BlobService();

  String dropdownValue = readingCategories.first;
  bool isLoading = false;

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
            const Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 8, top: 8),
                  child: BardenCloseIcon(),
                ),
              ],
            ),
            BardenField(
              width: 240,
              fieldName: "ISBN", 
              onFieldChanged: () {
                setState(() {
                  isLoading = true;
                });

                _blob.addNewBook();

                setState(() {
                  isLoading = false;
                });
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (val) {
                        widget.onCategoryChanged(val!);    
                        setState(() {
                          dropdownValue = val;
                        });
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
                  width: 100,
                  fieldName: "Year", 
                  onFieldChanged: () {
                
                }),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BardenButton(
                  text: "ADD", 
                  onPressed: () {
                    
                  }, 
                  isLoading: isLoading, 
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
