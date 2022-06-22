import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StreamSubscriptionTest extends StatefulWidget {
  const StreamSubscriptionTest({Key? key}) : super(key: key);

  @override
  _StreamSubscriptionTestState createState() => _StreamSubscriptionTestState();
}

class _StreamSubscriptionTestState extends State<StreamSubscriptionTest> {

  // final StreamController<dynamic> _streamController = StreamController<dynamic>();

  // Resolved in the error like this `Bad state: Stream has already been listened to.`
  final StreamController<dynamic> _streamController = StreamController<dynamic>.broadcast();

  StreamSubscription? _streamSubscription;

  /// Learn from : https://medium.com/flutter-community/flutter-stream-basics-for-beginners-eda23e44e32f
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamSubscriptionTest"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async{
                  // Stream _stream = _streamController.stream;
                  // _streamSubscription = _stream.listen((value) {
                  //   if (kDebugMode) {
                  //     print("SubscriptionValue $value");
                  //   }
                  // });
                 getRandomValues().listen((value) {
                   if (kDebugMode) {
                     print("getRandomValues $value");
                   }
                 });
                },
                child: Container(
                width: size.width * 0.3,
                  height: 50,
                  color: Colors.pink,
                  child: const Center(child: Text("Subscription", style: TextStyle(color: Colors.white),)),
                ),
              ),
              InkWell(
                onTap: (){
                  _streamController.add(20);
                },
                child: Container(
                  width: size.width * 0.3,
                  height: 50,
                  color: Colors.pink,
                  child: const Center(child: Text("Value", style: TextStyle(color: Colors.white),)),
                ),
              ),
              InkWell(
                onTap: () =>  _streamSubscription?.cancel(),
                child: Container(
                  width: size.width * 0.3,
                  height: 50,
                  color: Colors.pink,
                  child: const Center(child: Text("UnSubscription", style: TextStyle(color: Colors.white),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> getRandomValues() async* {
    var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
     yield random.nextDouble();
    }
  }
}
