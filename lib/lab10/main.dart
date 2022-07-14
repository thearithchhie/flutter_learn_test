import 'package:flutter/material.dart';
import 'package:flutter_learn_test/lab10/lab10_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: StreamTest(),
      home: Lab10Body(),
    );
  }
}