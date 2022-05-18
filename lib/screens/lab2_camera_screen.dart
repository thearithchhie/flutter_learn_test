import 'package:flutter/material.dart';

import 'lab2_navigation.dart';

class Lab2CameraScreen extends StatefulWidget {
  const Lab2CameraScreen({Key? key}) : super(key: key);

  @override
  _Lab2CameraScreenState createState() => _Lab2CameraScreenState();
}

class _Lab2CameraScreenState extends State<Lab2CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab2 Camera Screen"),
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Lab2Navigation()),
            );
          }, icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
