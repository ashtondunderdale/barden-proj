import 'package:elysium/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/elysium_user.dart';
import '../models/note.dart';
import 'note_service.dart';


class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;


  static Future<ElysiumUser?> tryLogin(String email, String password) async {
      try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
                                        email: email, 
                                        password: password
                                      );

      User? firebaseUser = result.user;

      //var userData = await DatabaseService(userID: firebaseUser!.uid).getUserData();
      var elysiumUser = createElysiumUser(firebaseUser, "");

      if (elysiumUser != null) {
        await DatabaseService(userID: firebaseUser!.uid).updateUserData(elysiumUser);
      }

      return elysiumUser;

    } catch (exception) {
      print(exception);
      return null;
    }
  }

  static Future<ElysiumUser?> tryRegister(String email, String password, String username) async {
      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
                                  email: email, 
                                  password: password
                                );
        
        User? firebaseUser = result.user;
        var elysiumUser = createElysiumUser(firebaseUser, username);

        if (elysiumUser != null) {
          await DatabaseService(userID: firebaseUser!.uid).updateUserData(elysiumUser);
        }

        return elysiumUser;

      } catch (exception) {
        print("Register Exception: $exception");
        return null;
      }
  }

  static ElysiumUser? createElysiumUser(User? user, String username) {

    if (user != null) {

      ElysiumUser elysiumUser = ElysiumUser(userID: user.uid, username: username);

      if (elysiumUser.notes.isEmpty) {
        NoteService.createNote("Untitled", "", elysiumUser);
      }

      return elysiumUser;
    }
    else {
      return null;
    }
  }
}