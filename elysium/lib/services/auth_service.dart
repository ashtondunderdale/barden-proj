import 'package:elysium/models/elysium_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> tryLogin(String email, String password) async {
      try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
                                        email: email, 
                                        password: password
                                      );
      User firebaseUser = result.user!;
      return true;

    } catch (exception) {
      print(exception);
      return false;
    }
  }

  static Future<bool> tryRegister(String email, String password) async {
      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
                                  email: email, 
                                  password: password
                                );
        
        User? firebaseUser = result.user;
        return true;

      } catch (exception) {
        print(exception);
        return false;
      }
  }
}