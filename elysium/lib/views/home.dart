import 'package:elysium/models/elysium_user.dart';
import 'package:elysium/services/note_service.dart';
import 'package:elysium/utils/styles.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.elysiumUser});

  final ElysiumUser elysiumUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController contentController = TextEditingController();
  late final Note activeNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 256,
            height: MediaQuery.sizeOf(context).height,
            color: Styles.lightGrey,
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Styles.mediumGrey,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {

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
                Text("${widget.elysiumUser.notes.length}")
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width / 8 - 64),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width / 2,
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
                    height: MediaQuery.sizeOf(context).height / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.mediumGrey),
                      borderRadius: BorderRadius.circular(Styles.borderRadius),
                      color: Styles.lightGrey,
                    ),
                    child: TextField(
                      controller: contentController,
                      onChanged: (isChanged) {
                        if (widget.elysiumUser.notes.isEmpty) {
                          Note note = NoteService.createNote("Untitled Note", contentController.text, widget.elysiumUser);
                          activeNote = note;
                        }

                          NoteService.updateNote(contentController.text, activeNote);

                          print(activeNote.content);
                          print(activeNote.title);

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
          ),
          const Spacer(),
        ],
      )
    );
  }
}