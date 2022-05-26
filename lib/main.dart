import 'package:flutter/material.dart';
import 'package:flutter_learn_test/screens/lab2_navigation.dart';
import 'package:flutter_learn_test/screens/sum_sum_screen.dart';

import 'bloc/counter_bloc/counter_ui_bloc.dart';
import 'clock/clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Lab2Navigation(),
      // home: ClockScreen(),
      home: const CounterUiBloc(),
    );
  }
}