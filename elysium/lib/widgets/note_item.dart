import 'package:elysium/utils/styles.dart';
import 'package:flutter/material.dart';

import '../models/elysium_user.dart';
import '../models/note.dart';

class NoteItem extends StatefulWidget {
  NoteItem({Key? key, required this.note, required this.contentController, required this.elysiumUser, required void Function(Note newActiveNote) updateActiveNote}) : super(key: key);

  final Note note;
  final TextEditingController contentController;
  final ElysiumUser elysiumUser;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  Color noteItemColor = Styles.lightGrey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () {
          widget.elysiumUser.updateActiveNote(widget.note);
          widget.contentController.text = widget.note.content;

          setState(() {
            noteItemColor = Colors.white;
          });
        },
        child: Container(
          height: 32,
          width: 180,
          decoration: BoxDecoration(
            color: noteItemColor,
            borderRadius: BorderRadius.circular(Styles.borderRadius),
            border: Border.all(color: noteItemColor),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                widget.note.title,
                style: const TextStyle(color: Styles.mediumGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
