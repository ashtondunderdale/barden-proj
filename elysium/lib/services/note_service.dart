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

static String generateNoteName(List<Note> userNotes) {
  String baseTitle = "Untitled";  
  String newNoteTitle = baseTitle;
  int loopIndex = 0;

  String generateNewTitle() {
    return loopIndex == 0 ? baseTitle : "$baseTitle $loopIndex";
  }

  while (userNotes.any((note) => note.title == newNoteTitle)) {
    loopIndex++;
    newNoteTitle = generateNewTitle();
  }

  return newNoteTitle;
  }
}