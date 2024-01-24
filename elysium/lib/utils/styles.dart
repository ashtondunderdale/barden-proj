import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final TextStyle font = GoogleFonts.lato();
  static const Color lightGrey = Color.fromARGB(255, 230, 230, 230);

  static InputDecoration loginDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Colors.grey.shade500),
    ),
  );

  static TextStyle loginHintStyle = font.copyWith(
    color: Colors.grey,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
  );
}
