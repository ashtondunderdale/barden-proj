import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenField extends StatelessWidget {
  const BardenField({super.key, required this.width, required this.fieldName, required this.onFieldChanged, required this.controller});

  final double width;
  final String fieldName;
  final TextEditingController controller;

  final VoidCallback onFieldChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width, height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4)
      ),
      child: TextField(
        controller: controller,
        style: primaryFont.copyWith(
          color: Colors.grey,
          fontSize: 12
        ),
        decoration: InputDecoration(    
          contentPadding: const EdgeInsets.all(13.0),
          hintText: fieldName,
          border: InputBorder.none,
        ),
      ),
    ),
  );
}