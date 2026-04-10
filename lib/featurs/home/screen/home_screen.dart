import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: TextStyle(color: Colors.white,fontSize: 28),),
      backgroundColor: Color(0xff856DAD),
        automaticallyImplyLeading: false,
      ),

    );
  }
}
