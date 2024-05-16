import 'package:flutter/material.dart';

class BardenDashboard extends StatelessWidget {
  const BardenDashboard({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.sizeOf(context).width * 0.8,
    height: MediaQuery.sizeOf(context).height * 0.9,
    decoration: BoxDecoration(
      color: Colors.red
    ),
  );
}