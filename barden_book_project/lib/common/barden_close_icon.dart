import 'package:flutter/material.dart';

import '../constants.dart';

class BardenCloseIcon extends StatelessWidget {
  const BardenCloseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          color: bardenPurple,
          size: 20,
        ),
      ),
    );
  }
}