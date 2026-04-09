import 'package:flutter/material.dart';
import 'package:web/featurs/auth/screen/forgot_screen.dart';
import 'package:web/featurs/auth/screen/verify_screen.dart';

import '../featurs/auth/screen/login_screen.dart';


class Rabbito extends StatelessWidget {
  const Rabbito ({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rabbito",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}