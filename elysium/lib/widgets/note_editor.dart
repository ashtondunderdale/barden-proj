import 'package:flutter/material.dart';
import 'package:elysium/utils/styles.dart';
import 'package:elysium/services/note_service.dart';
import '../models/note.dart';

class NoteEditor extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final Note activeNote;

  const NoteEditor({
    Key? key,
    required this.titleController,
    required this.contentController,
    required this.activeNote,
  }) : super(key: key);

  @override
  State<NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        border: Border.all(color: Styles.mediumGrey),
        borderRadius: BorderRadius.circular(Styles.borderRadius),
        color: Styles.lightGrey,
      ),
      child: Column(
        children: [
          TextField(
            controller: widget.titleController,
            onChanged: (isChanged) {
              NoteService.updateNoteTitle(widget.titleController.text, widget.activeNote);
              widget.activeNote.title = widget.titleController.text;
              setState(() {});
            },
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.0),
              hintText: "Write here.",
            ),
            style: const TextStyle(
              color: Styles.darkGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: TextField(
              controller: widget.contentController,
              onChanged: (isChanged) {
                NoteService.updateNoteContent(widget.contentController.text, widget.activeNote);
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
    );
  }
}
