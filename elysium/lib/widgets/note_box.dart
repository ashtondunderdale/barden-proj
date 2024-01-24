import 'package:flutter/material.dart';

import '../models/note.dart';
import '../services/note_service.dart';
import '../utils/styles.dart';

class NoteBox extends StatefulWidget {
  const NoteBox({super.key, required this.activeNote, required this.contentController});
  
  final Note activeNote;
  final TextEditingController contentController;

  @override
  State<NoteBox> createState() => _NoteBoxState();
}

class _NoteBoxState extends State<NoteBox> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 8 - 64),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "taking notes...",
                style: Styles.titleTextStyle,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                border: Border.all(color: Styles.mediumGrey),
                borderRadius: BorderRadius.circular(Styles.borderRadius),
                color: Styles.lightGrey,
              ),
              child: TextField(
                controller: widget.contentController,
                onChanged: (isChanged) {
                  NoteService.updateNote(widget.contentController.text, widget.activeNote);
                  setState(() {});
                },
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: "Write here.",
                ),
                style: const TextStyle(color: Styles.mediumGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}