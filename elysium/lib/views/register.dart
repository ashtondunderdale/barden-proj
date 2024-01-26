import 'package:elysium/models/elysium_user.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utils/styles.dart';
import 'login.dart';
import 'notes.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
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
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Register",
                        style: Styles.loginHintStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        cursorColor: Styles.mediumGrey,
                        controller: emailController,
                        validator: _validateEmail,
                        decoration: Styles.loginDecoration.copyWith(
                          hintText: "email",
                          hintStyle: Styles.loginHintStyle,
                        ),
                        style: Styles.loginHintStyle,
                      ),
                    ),
                    TextFormField(
                      cursorColor: Styles.mediumGrey,
                      controller: passwordController,
                      obscureText: true,
                      validator: _validatePassword,
                      decoration: Styles.loginDecoration.copyWith(
                        hintText: "password",
                        hintStyle: Styles.loginHintStyle,
                      ),
                      style: Styles.loginHintStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: TextFormField(
                        cursorColor: Styles.mediumGrey,
                        controller: usernameController,
                        decoration: Styles.loginDecoration.copyWith(
                          hintText: "username",
                          hintStyle: Styles.loginHintStyle,
                        ),
                        style: Styles.loginHintStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            ElysiumUser? elysiumUser = await AuthService.tryRegister(
                              emailController.text, 
                              passwordController.text,
                              usernameController.text
                            );
              
                            if (elysiumUser != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Styles.lightGrey,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 128),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Or Login here",
                          style: Styles.loginHintStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
