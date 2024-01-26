import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/elysium_user.dart';


class DatabaseService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  final String userID;
  DatabaseService({required this.userID});

  Future<void> updateUserData(ElysiumUser elysiumUser) async {
    List<Map<String, dynamic>> notesList = elysiumUser.notes.map((note) {
      return {
        'title': note.title,
        'content': note.content,
      };
    }).toList();

    return await users.doc(userID).set({
      'userID': elysiumUser.userID,
      'username': elysiumUser.username,
      'Notes': notesList,
    });
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      DocumentSnapshot document = await users.doc(userID).get();

      if (document.exists) {
        return document.data() as Map<String, dynamic>;
      } 
      else {
        return null;
      }
    } catch (exception) {
      print("Error fetching user data: $exception");
      return null;
    }
  }
}
