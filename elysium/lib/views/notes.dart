import 'package:elysium/models/elysium_user.dart';
import 'package:elysium/services/note_service.dart';
import 'package:elysium/utils/styles.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';
import '../widgets/note_item.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key, required this.elysiumUser}) : super(key: key);

  final ElysiumUser elysiumUser;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  late Note activeNote;
  Color noteItemColour = Styles.lightGrey;

  @override
  void initState() {
    super.initState();
    activeNote = widget.elysiumUser.notes[0]; // this might need changing
    setActiveNote(activeNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 256,
            height: MediaQuery.of(context).size.height,
            color: Styles.lightGrey,
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Styles.mediumGrey,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                            String noteTitle = NoteService.generateNoteTitle(widget.elysiumUser.notes);
                            setState(() {
                              activeNote = NoteService.createNote(noteTitle, "", widget.elysiumUser);
                              setActiveNote(activeNote);
                            });
                        },
                        icon: const Icon(
                          Icons.book,
                          color: Styles.mediumGrey,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      NoteItem(
                        notes: widget.elysiumUser.notes,
                        activeNote: activeNote,
                        onTap: (Note note) {
                          setState(() {
                            activeNote = note;
                            contentController.text = note.content;
                            titleController.text = note.title;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 8 - 64),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "take note...",
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
                    child: Column(
                      children: [
                        TextField(
                          controller: titleController,
                          onChanged: (isChanged) {
                            NoteService.updateNoteTitle(titleController.text, activeNote);
                            activeNote.title = titleController.text;                
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
                            controller: contentController,
                            onChanged: (isChanged) {
                              NoteService.updateNoteContent(contentController.text, activeNote);
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
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void setActiveNote(Note note) {
    activeNote = note;
    titleController.text = note.title;
    contentController.text = note.content;
  }
}