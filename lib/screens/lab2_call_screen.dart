import 'package:flutter/material.dart';

class Lab2CallScreen extends StatefulWidget {
  const Lab2CallScreen({Key? key}) : super(key: key);

  @override
  _Lab2CallScreenState createState() => _Lab2CallScreenState();
}

class _Lab2CallScreenState extends State<Lab2CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Call App Bar"),
        backgroundColor: Colors.red,
      ),
    );
  }
}
