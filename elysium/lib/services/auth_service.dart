import 'package:elysium/models/elysium_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<ElysiumUser?> tryLogin(String email, String password) async {
      try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
                                        email: email, 
                                        password: password
                                      );

      User? firebaseUser = result.user;
      var elysiumUser = createElysiumUser(firebaseUser);

      return elysiumUser;

    } catch (exception) {
      print(exception);
      return null;
    }
  }

  static Future<ElysiumUser?> tryRegister(String email, String password) async {
      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
                                  email: email, 
                                  password: password
                                );
        
        User? firebaseUser = result.user;
        var elysiumUser = createElysiumUser(firebaseUser);
        
        return elysiumUser;

      } catch (exception) {
        print(exception);
        return null;
      }
  }

  static ElysiumUser? createElysiumUser(User? user) {

    if (user != null) {
      return ElysiumUser(userID: user.uid);
    }
    else {
      return null;
    }
  }
}