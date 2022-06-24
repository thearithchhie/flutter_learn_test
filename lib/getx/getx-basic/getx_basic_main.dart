import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_test/getx/getx-basic/view/counter_view.dart';
import 'package:get/get.dart';

void main(){
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
      home: CounterViewGetXBasic(),
    );
  }
}