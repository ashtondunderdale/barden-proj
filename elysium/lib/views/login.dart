import 'package:flutter/material.dart';

import '../services/login_service.dart';
import '../utils/styles.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 256),
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextField(
                    controller: emailController,
                    decoration: Styles.loginDecoration.copyWith(
                      hintText: "email",
                      hintStyle: Styles.loginHintStyle,
                    ),
                    style: Styles.loginHintStyle,
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: Styles.loginDecoration.copyWith(
                    hintText: "password",
                    hintStyle: Styles.loginHintStyle,
                  ),
                  style: Styles.loginHintStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: IconButton(
                    onPressed: () => LoginService.tryLogin(emailController.text, passwordController.text),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Styles.lightGrey,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}