import 'package:flutter/material.dart';
import 'package:flutter_learn_test/provider/view_model/provider_counter_viewmodel.dart';
import 'package:provider/provider.dart';
import 'provider_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(create: (BuildContext context) => CounterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: ConsummerScreen(),
      ),
    );
  }
}