import 'note.dart';

class ElysiumUser {
  String userID;
  String username;

  List<Note> notes = [];


  ElysiumUser({required this.userID, required this.username});
}