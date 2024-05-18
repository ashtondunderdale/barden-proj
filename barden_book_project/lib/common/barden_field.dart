import 'package:flutter/material.dart';

class BardenField extends StatelessWidget {
  const BardenField({super.key, required this.width, required this.fieldName, required this.onFieldChanged});

  final double width;
  final String fieldName;

  final VoidCallback onFieldChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width, height: 30,
    child: const TextField(
      
    ),
  );
}