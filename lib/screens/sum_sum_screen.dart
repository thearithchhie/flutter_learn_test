import 'package:flutter/material.dart';

class ChildCounterScreen extends StatelessWidget {

  final keyCounter = GlobalKey<_CounterScreenState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: InkWell(
        onTap: () => keyCounter.currentState?.increment(),
        child: Center(
          child: Text("Counter= ${keyCounter.currentState?.counter}"),
        ),
      ),
    );
  }
}




class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increment(){
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Counter= $counter"),
      ),
    );
  }
}
