import 'package:elysium/utils/styles.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: Styles.inputDecorationStyle.copyWith(
                  hintText: "email",
                ),
                style: Styles.plainTextStyle,
              ),
              TextField(
                controller: passwordController,
                decoration: Styles.inputDecorationStyle.copyWith(
                  hintText: "password",
                ),
                style: Styles.plainTextStyle,
              ),
              IconButton(
                onPressed: () {
                  
                }, 
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
