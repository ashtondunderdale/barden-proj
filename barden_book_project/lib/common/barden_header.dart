import 'package:flutter/material.dart';

import '../constants.dart';

class BardenHeader extends StatelessWidget {
  const BardenHeader({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        "Barden Primary",
        style: primaryFont.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: bardenPurple,
          letterSpacing: 1
        ),
      ),
      Text(
        "Library Management",
        style: primaryFont.copyWith(
          fontSize: 14,
          color: Colors.grey,
          letterSpacing: 1
        ),
      ),
    ],
  );
}
