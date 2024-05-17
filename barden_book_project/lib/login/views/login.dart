import 'package:barden_book_project/login/models/login.dart';
import 'package:barden_book_project/login/services/auth.dart';
import 'package:barden_book_project/constants.dart';
import 'package:barden_book_project/login/widgets/barden_button.dart';
import 'package:barden_book_project/login/widgets/barden_header.dart';
import 'package:barden_book_project/login/widgets/barden_textfield.dart';
import 'package:barden_book_project/home/views/home.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = BardenAuth();
  final _storage = const FlutterSecureStorage();
  
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String authMessage = "";
  bool rememberMe = false;
  bool isWaitingForLoginResponse = false;

  @override
  void initState() {
    super.initState();
    _getSavedLoginDetails();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLeftLoginBox(context),
          _buildRightLoginBox(context),
        ],
      ),
    ),
  );
    
  Widget _buildLeftLoginBox(BuildContext context) => Container(
    width: 600,
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(
      color: bardenPurple,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(4), 
        bottomLeft: Radius.circular(4)
      ),
      boxShadow: [defaultBoxShadow],
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.15,
            child: Image.asset('../assets/barden_primary_reading_graphic.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Image.asset('../assets/barden_primary_logo.png', 
            height: 140,
          ),
        ),
      ],
    ),
  );


  Widget _buildRightLoginBox(BuildContext context) => Container(
    width: 400,
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(    
      color: Colors.white,
      borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
      boxShadow: [defaultBoxShadow],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 20),
        const BardenHeader(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 136),
          child: Text(
            "STAFF LOGIN",
            style: primaryFont.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          ),
        ),
        BardenTextfield(text: "username", isPassword: false, controller: usernameController),
        const SizedBox(height: 20),
        BardenTextfield(text: "password", isPassword: true, controller: passwordController),
        Padding(
          padding: const EdgeInsets.only(left: 60, top: 16),
          child: Row(
            children: [
              Checkbox(value: rememberMe, activeColor: bardenPurple,
              onChanged: (_) {
                setState(() => rememberMe = !rememberMe );
              }),
              Text(
                "Remember me",
                style: primaryFont.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 12
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 60),
        Text(
          authMessage,
          style: const TextStyle(
            color: Color.fromARGB(255, 234, 108, 99),
            fontSize: 12
          ),
        ),
        BardenButton(
          width: 200,
          isLoading: isWaitingForLoginResponse,
          text: "LOGIN", 
          onPressed: () {
            _tryLogin();
          }
        ),
        const SizedBox(height: 20)
      ],
    ),
  );

  void _tryLogin() async {
    setState(() => isWaitingForLoginResponse = true );

    await Future.delayed(const Duration(seconds: 1)); // TODO: remove this for prod

    var auth = AuthModel(
      username: usernameController.text,
      password: passwordController.text
    );

    var authSuccess = _auth.loginWithUsernameAndPassword(auth);

    setState(() => isWaitingForLoginResponse = false);

    if (!authSuccess) {
      setState(() {
        authMessage = _auth.incorrectDetailsMessage;
        passwordController.clear();
      });

      return;
    }

    if (rememberMe) {
      _loadSavedLoginDetails();
    } else {
      _deleteSavedLoginDetails();
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Home()));
  }

  void _loadSavedLoginDetails() async {
    await _storage.write(key: 'password', value: passwordController.text);
    await _storage.write(key: 'username', value: usernameController.text);
  }

  void _deleteSavedLoginDetails() async {
    await _storage.delete(key: 'password');
    await _storage.delete(key: 'username');
  }

  void _getSavedLoginDetails() async {
    String savedPassword = await _storage.read(key: 'password') ?? '';
    String savedUsername = await _storage.read(key: 'username') ?? '';
    
    if (savedPassword.isEmpty) {
      return;
    }

    setState(() {
      passwordController.text = savedPassword;
      usernameController.text = savedUsername;

      rememberMe = true;     
    });
  }
}
