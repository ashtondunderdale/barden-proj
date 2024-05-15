import 'package:barden_book_project/authentication/views/login.dart';
import 'package:flutter/material.dart';

void main() =>
  runApp(const App());


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login()
  );
}

