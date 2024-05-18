import 'package:barden_book_project/constants.dart';
import 'package:flutter/material.dart';

class BardenTextfield extends StatefulWidget {
  const BardenTextfield({super.key, 
    required this.text,
    required this.isPassword,
    required this.controller,
  });

  final String text;
  final bool isPassword;
  final TextEditingController controller;

  @override
  _BardenTextfieldState createState() => _BardenTextfieldState();
}

class _BardenTextfieldState extends State<BardenTextfield> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 280,
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.controller,
            style: primaryFont.copyWith(
              color: Colors.grey,
              fontSize: 12,
            ),
            obscureText: widget.isPassword && !showPassword,
            decoration: InputDecoration(
              labelText: widget.text,
              labelStyle: primaryFont.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bardenPurple),
              ),
              suffixIcon: widget.isPassword ? IconButton(
                onPressed: () {
                  setState(() => showPassword = !showPassword);
                },
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                  size: 18,
                ),
              ) : null,
            ),
          ),
        ),
      ],
    ),
  );
}
