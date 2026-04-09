import 'package:flutter/material.dart';

import '../featurs/auth/screen/login_screen.dart';


class Rabbito extends StatelessWidget {
  const Rabbito ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Rabbito",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}