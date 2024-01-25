import 'package:elysium/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/elysium_user.dart';


class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<ElysiumUser?> tryLogin(String email, String password) async {
      try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
                                        email: email, 
                                        password: password
                                      );

      User? firebaseUser = result.user;
      var elysiumUser = createElysiumUser(firebaseUser, "");

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
        
        await DatabaseService(userID: firebaseUser!.uid).updateUserData(firebaseUser.uid, username);

        return elysiumUser;

      } catch (exception) {
        print(exception);
        return null;
      }
  }

  static ElysiumUser? createElysiumUser(User? user, String username) {

    if (user != null) {
      return ElysiumUser(userID: user.uid, username: username);
    }
    else {
      return null;
    }
  }
}