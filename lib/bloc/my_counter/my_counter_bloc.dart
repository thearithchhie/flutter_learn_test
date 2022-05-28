import 'dart:async';

import 'package:flutter_learn_test/bloc/my_counter/my_counter_event.dart';

class MyCounterBloc {
  late int _counter = 0;

  var _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // For state, exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<MyCounterEvent>();
  // For events, exposing only a sink which is an input
  Sink<MyCounterEvent> get counterEventSink => _counterEventController.sink;

   CounterBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(MyCounterEvent event) {
     if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
