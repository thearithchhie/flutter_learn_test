import 'package:flutter/material.dart';
import 'package:flutter_learn_test/bloc/search/ui/article_list_item.dart';
import 'package:flutter_learn_test/stream/stream_subscription.dart';
import 'package:flutter_learn_test/stream/stream_test.dart';
import 'package:flutter_learn_test/stream/strem-sum.dart';


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
      home: ArticleListItem(),
    );
  }
}