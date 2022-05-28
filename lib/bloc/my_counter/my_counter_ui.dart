import 'package:flutter/material.dart';
import 'package:flutter_learn_test/bloc/my_counter/my_counter_bloc.dart';

import 'my_counter_event.dart';

class MyCounterUi extends StatefulWidget {
  const MyCounterUi({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<MyCounterUi> createState() => _MyCounterUiState();
}

class _MyCounterUiState extends State<MyCounterUi> {
   final _bloc = MyCounterBloc();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("dsafsaf"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  // style: Theme.of(context).textTheme.display1,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }


@override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}