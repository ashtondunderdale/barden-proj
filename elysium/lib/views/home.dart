import 'package:elysium/models/elysium_user.dart';
import 'package:elysium/services/note_service.dart';
import 'package:elysium/utils/styles.dart';
import 'package:elysium/widgets/note_box.dart';
import 'package:elysium/widgets/note_list.dart';
import 'package:flutter/material.dart';

import '../models/note.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.elysiumUser}) : super(key: key);

  final ElysiumUser elysiumUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController contentController = TextEditingController();
  late Note activeNote;

  @override
  void initState() {
    super.initState();
    activeNote = NoteService.createNote("Untitled", "", widget.elysiumUser);
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
                          activeNote = NoteService.createNote("testnote", "", widget.elysiumUser);
                          contentController.text = activeNote.content;
                          setState(() {});
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
                NoteList(elysiumUser: widget.elysiumUser, contentController: contentController, activeNote: activeNote),
              ],
            ),
          ),
          const Spacer(),
          NoteBox(activeNote: activeNote, contentController: contentController),
          const Spacer(),
        ],
      ),
    );
  }
}
