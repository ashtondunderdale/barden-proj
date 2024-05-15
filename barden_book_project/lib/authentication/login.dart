import 'package:barden_book_project/constants.dart';
import 'package:barden_book_project/widgets/barden_button.dart';
import 'package:barden_book_project/widgets/barden_textfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(-3, 0),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Image.asset(
            '../assets/barden_primary_logo.png', 
            fit: BoxFit.fitHeight,
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
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(3, 0),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BardenTextfield(text: "email", isPassword: false, controller: emailController),
        const SizedBox(height: 20),
        BardenTextfield(text: "password", controller: passwordController),
        const SizedBox(height: 60),
        BardenButton(
          text: "LOGIN", 
          onPressed: () {
            // authenticate here
          }
        )
      ],
    ),
  );
}