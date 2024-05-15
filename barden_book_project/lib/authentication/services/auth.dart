import 'package:barden_book_project/authentication/models/login.dart';

class BardenAuth {

  String incorrectDetailsMessage = "Username or password is incorrect.";

  bool loginWithUsernameAndPassword(AuthModel auth) {

    print(auth.username);
    print(auth.password);

    return true;
  }
}