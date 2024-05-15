import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenButton extends StatefulWidget {
  const BardenButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  State<BardenButton> createState() => _BardenButtonState();
}

class _BardenButtonState extends State<BardenButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedOpacity(
            opacity: isHovered ? 0.7 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: 240,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bardenGreen                 
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 1
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
