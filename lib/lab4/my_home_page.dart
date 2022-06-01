import 'package:flutter/material.dart';

import 'my_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'.toUpperCase()),
      ),
      body: const SafeArea(
        child: MyBodyApp(),
      ),
    );
  }
}
