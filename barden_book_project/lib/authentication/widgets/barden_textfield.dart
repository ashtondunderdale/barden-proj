import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenTextfield extends StatelessWidget {
  const BardenTextfield({super.key, required this.text, this.isPassword = false, required this.controller});
  
  final String text;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 280,
    child: TextField(
      controller: controller,
      style: primaryFont.copyWith(
        color: Colors.grey,
        fontSize: 12
      ),
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: primaryFont.copyWith(
          color: Colors.grey,
          fontSize: 12
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bardenPurple),
        ),
      ),
    ),
  );
}

