import 'package:flutter/material.dart';

import 'lab4/my_home_page.dart';
import 'lab5/home_page_lab5.dart';


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
      // home: const MyHomePage(),
      home: MyHomePageLab5(),
    );
  }
}