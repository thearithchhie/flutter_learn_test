import 'dart:async';

import 'package:flutter/material.dart';

class StreamTest extends StatefulWidget {
  const StreamTest({Key? key}) : super(key: key);

  @override
  _StreamTestState createState() => _StreamTestState();
}

class _StreamTestState extends State<StreamTest> {

  /// stream controller Flutter make it`s first `Stream`
  /// 'StreamController' and  'Stream' it`s the same
  /// Noted:: If you use 'StreamController' need dispose for clear memory lead
  /// Noted:: if you use 'Stream' no need dispose , why? , because 'Stream' closed memory lead already
  ///
  /// Learn From: https://www.youtube.com/watch?v=H8c2rpOHZVc&t=627s

  final StreamController _streamController = StreamController();

  addSteam() async {
    for(int i=0; i<=10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      _streamController.sink.add(i);
    }
  }

  /// Stream
  Stream<int> getStream() async* {
    for(int i=0; i<=10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    addSteam();
    super.initState();
  }

  /// For StreamController
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("text stream"),
  //     ),
  //     body: Align(
  //       alignment: Alignment.center,
  //       child: StreamBuilder(
  //         stream: _streamController.stream,
  //         builder: (context, snapshot){
  //           print("${snapshot.data}");
  //           if(snapshot.hasError){
  //            return const Text("hasError");
  //           }else if(snapshot.connectionState == ConnectionState.waiting) {
  //             return const CircularProgressIndicator();
  //           }
  //             return Container(
  //               width: 50,
  //               height: 50,
  //               color: Colors.pink,
  //               child: Center(child: Text("${snapshot.data}", style: const TextStyle(color: Colors.white),)),
  //             );
  //         },
  //       )
  //     ),
  //   );
  // }

/// For Stream
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("text stream"),
      ),
      body: Align(
          alignment: Alignment.center,
          child: StreamBuilder(
            // stream: getStream().where((event) => event % 2 ==0), if use want condition
            stream: getStream().map((event) => "Number $event"),
            // stream: getStream()),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return const Text("hasError");
              }else if(snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return Container(
                width: size.width * 0.2,
                height: 50,
                color: Colors.pink,
                child: Center(child: Text("${snapshot.data}", style: const TextStyle(color: Colors.white),)),
              );
            },
          )
      ),
    );
  }
}


