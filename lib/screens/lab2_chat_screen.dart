import 'package:flutter/material.dart';

class Lab2ChatScreen extends StatefulWidget {
  const Lab2ChatScreen({Key? key}) : super(key: key);

  @override
  _Lab2ChatScreenState createState() => _Lab2ChatScreenState();
}

class _Lab2ChatScreenState extends State<Lab2ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab2 Chat Screen"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
