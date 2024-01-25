import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final TextStyle font = GoogleFonts.lato();
  static const double textSize = 14;

  static const Color lightGrey = Color.fromARGB(255, 230, 230, 230);
  static const Color lightMediumGrey = Color.fromARGB(255, 199, 199, 199);
  static const Color mediumGrey = Color.fromARGB(255, 158, 158, 158);
  static const Color darkGrey = Color.fromARGB(255, 90, 90, 90);

  static const double borderRadius = 8;

  static InputDecoration loginDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: lightGrey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: lightGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(color: lightGrey),
    ),
  );

  static TextStyle loginHintStyle = font.copyWith(
    color: Colors.grey,
    fontSize: textSize,
    fontWeight: FontWeight.normal,
  );

  static TextStyle elysiumTitleStyle = TextStyle(
    fontSize: 96, 
    color: const Color.fromARGB(255, 149, 149, 149),
    letterSpacing: 4,
    fontFamily: GoogleFonts.libreBaskerville().fontFamily,
    fontStyle: FontStyle.italic,
  );

    static TextStyle titleTextStyle = TextStyle(
    fontSize: 32, 
    color: const Color.fromARGB(255, 149, 149, 149),
    letterSpacing: 1,
    fontFamily: GoogleFonts.libreBaskerville().fontFamily,
    fontStyle: FontStyle.italic,
  );
}
