import 'package:flutter/material.dart';

import 'body_lab5.dart';


class MyHomePageLab5 extends StatelessWidget {
  const MyHomePageLab5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'.toUpperCase()),
      ),
      body: const SafeArea(
        child: MyBodyAppLab5(),
      ),
    );
  }
}
