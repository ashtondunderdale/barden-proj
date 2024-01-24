import 'package:elysium/views/home.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 96),
            child: Text(
              "Elysium",
              style: Styles.elysiumTitleStyle,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 256),
              child: SizedBox(
                width: 300,
                child: Column(
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
                        onPressed: () {
                          if(LoginService.tryLogin(emailController.text, passwordController.text)) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                          }
                        },
                        icon: Tooltip(
                          margin: EdgeInsets.only(top: 16),
                          decoration: Styles.tooltipBoxDecoration,
                          textStyle: Styles.tooltipTextStyle,
                          message: "Login",
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Styles.lightGrey,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}