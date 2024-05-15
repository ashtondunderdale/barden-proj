import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
  );
}
