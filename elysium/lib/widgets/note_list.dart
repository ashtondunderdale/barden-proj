import 'package:elysium/models/elysium_user.dart';
import 'package:elysium/widgets/note_item.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';
import '../utils/styles.dart';

class NoteList extends StatefulWidget {
  NoteList({super.key, required this.elysiumUser, required this.contentController, required this.activeNote});

  final ElysiumUser elysiumUser;
  Note activeNote;
  final TextEditingController contentController;

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Column(
        children: [
          for (Note note in widget.elysiumUser.notes)
            TextButton(
              onPressed: () {
                setState(() {
                  widget.activeNote = note;
                  widget.contentController.text = note.content;
                });               
              },
              child: NoteItem(title: note.title),
            ),
        ],
      ),
    );
  }
}