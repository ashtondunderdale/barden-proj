import 'package:barden_book_project/widgets/barden_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 141, 84, 167),
      borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomRight: Radius.circular(4))
    ),
  );

  Widget _buildRightLoginBox(BuildContext context) => Container(
    width: 400,
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: const BoxDecoration(    
      color: Color.fromARGB(255, 224, 224, 224),
      borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BardenButton(
          text: "Login", 
          onPressed: () {
            // authenticate here
          }
        )
      ],
    ),
  );
}