import 'note.dart';

class ElysiumUser {

  List<Note> notes = [];

  Note _activeNote = Note(title: "", content:  ""); // Initialize with a default value or handle null as appropriate

  Note get activeNote => _activeNote;

  // Method to update the active note
  void updateActiveNote(Note newActiveNote) {
    _activeNote = newActiveNote;
  }
}