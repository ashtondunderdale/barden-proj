import 'package:elysium/models/elysium_user.dart';

import '../models/note.dart';

class NoteService {

  static Note createNote(String title, String content, ElysiumUser elysiumUser) {

    Note note = Note(title: title, content: content);
    elysiumUser.notes.add(note);
    return note;
  }

  static void updateNote(String content, Note note) {
    note.content = content;
  }
}