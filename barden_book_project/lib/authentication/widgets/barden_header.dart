import 'package:flutter/material.dart';

import '../../constants.dart';

class BardenHeader extends StatelessWidget {
  const BardenHeader({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(
        "Barden Primary",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: bardenPurple,
          letterSpacing: 1
        ),
      ),
      const Text(
        "Library Management",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          letterSpacing: 1
        ),
      ),
    ],
  );
}
