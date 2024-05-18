import 'package:flutter/material.dart';

import '../../common/barden_button.dart';
import '../../constants.dart';
import '../../login/views/login.dart';

class TopTitleBar extends StatelessWidget {
  const TopTitleBar({super.key, required this.activeAction});

  final String activeAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width - 200,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 16),
            child: Row(
              children: [
                Text(
                  activeAction,
                  style: primaryFont.copyWith(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
        BardenButton(
          width: 100,
          text: "LOGOUT", 
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
          }, 
          isLoading: false
        )
      ],
    );
  }
}