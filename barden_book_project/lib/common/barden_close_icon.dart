import 'package:flutter/material.dart';


class BardenIconButton extends StatelessWidget {
  const BardenIconButton({super.key, required this.icon, required this.onPressed});

  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: icon,
      ),
    );
  }
}