import 'package:flutter/material.dart';

void main() {
  runApp(const Elysium());
}

class Elysium extends StatelessWidget {
  const Elysium({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello Elysium!'),
        ),
      ),
    );
  }
}
