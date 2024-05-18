import 'package:flutter/material.dart';

import '../../../common/barden_button.dart';
import '../../../common/barden_field.dart';
import '../../../constants.dart';

class BardenAddBook extends StatefulWidget {
  BardenAddBook({super.key, required this.dropdownValue, required this.onCategoryChanged});

  String dropdownValue;
  final Function(String) onCategoryChanged;

  @override
  State<BardenAddBook> createState() => _BardenAddBookState();
}

class _BardenAddBookState extends State<BardenAddBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 420,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BardenField(
                  width: 240,
                  fieldName: "ISBN", 
                  onFieldChanged: () {
                    
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: DropdownButton<String>(
                          value: widget.dropdownValue,
                          onChanged: (val) {
                            widget.onCategoryChanged(val!);
            
                            setState(() {
                              widget.dropdownValue = val;
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
}