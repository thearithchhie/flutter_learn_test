import 'package:flutter/material.dart';
import 'package:flutter_learn_test/stream/stream_subscription.dart';
import 'package:flutter_learn_test/stream/stream_test.dart';
import 'lab6/main_lab6.dart';


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
        home: StreamSubscriptionTest(),
    );
  }
}