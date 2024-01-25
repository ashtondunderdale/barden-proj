import 'package:elysium/utils/styles.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 32,
        width: 180,
        decoration: BoxDecoration(
          color: Styles.lightGrey,
          borderRadius: BorderRadius.circular(Styles.borderRadius),
          border: Border.all(color: Styles.mediumGrey)
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Styles.mediumGrey
            ),
          ),
        ),
      ),
    );
  }
}