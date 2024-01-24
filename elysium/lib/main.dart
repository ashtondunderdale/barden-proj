import 'package:elysium/views/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/firebase_options.dart';


void main() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Elysium());
}

class Elysium extends StatelessWidget {
  const Elysium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
