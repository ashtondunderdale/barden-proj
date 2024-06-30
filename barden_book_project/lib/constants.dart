import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color bardenPurple = const Color.fromARGB(255, 132, 25, 132);
Color bardenGreen = const Color.fromARGB(255, 100, 189, 33);

TextStyle primaryFont = GoogleFonts.aBeeZee();

var defaultBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 3,
  blurRadius: 7,
  offset: const Offset(3, 0),
);

List<String> readingCategories = ["All", "Reading Challenge", "Class Novel", "Topic Book", "Library Book"];
List<String> readingYears = ["All", "EYFS", "1", "2", "3", "4", "5", "6"];