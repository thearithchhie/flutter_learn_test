import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class StreamSum extends StatefulWidget {
  const StreamSum({Key? key}) : super(key: key);

  @override
  _StreamSumState createState() => _StreamSumState();
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  print("Sum $sum");
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Stream<int> timedCounter(int interval, [dynamic maxCount = 0]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(Duration(seconds: interval));
    yield i++;
    if (i == maxCount) break;
  }
}

class _StreamSumState extends State<StreamSum>{

  late final StreamController _streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    var stream = countStream(2);
    var sum = sumStream(stream);
    // print(sum);
    var _timeCount = timedCounter(2, [10, 20]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamSum"),
      ),
    );
  }

}
