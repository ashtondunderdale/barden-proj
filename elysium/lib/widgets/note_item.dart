import 'package:flutter/material.dart';
import 'package:elysium/utils/styles.dart';
import '../models/note.dart';

class NoteItem extends StatelessWidget {
  final List<Note> notes;
  final Note activeNote;
  final Function(Note) onTap;

  const NoteItem({Key? key, required this.notes, required this.activeNote, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            for (Note note in notes)
              GestureDetector(
                onTap: () {
                  onTap(note);
                },
                child: Container(
                  height: 32,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Styles.lightGrey,
                    borderRadius: BorderRadius.circular(Styles.borderRadius),
                    border: Border.all(color: Styles.lightGrey),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        note.title.length > 16 ? "${note.title.substring(0, 16)}..." : note.title,
                        style: TextStyle(
                          color: Styles.mediumGrey,
                          fontWeight: activeNote == note ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
