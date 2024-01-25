import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  final String userID;
  DatabaseService({required this.userID});

  Future updateUserData(String userID, String username) async {
    return await users.doc(userID).set({
      'userID' : userID,
      'username' : username,
    });
  }
}