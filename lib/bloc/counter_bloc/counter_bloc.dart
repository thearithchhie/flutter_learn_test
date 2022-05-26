import 'dart:async';

enum CounterStatus {
  Increment,
  Decrement,
  Reset,
}

class CounterBloc {
  // ignore: prefer_typing_uninitialized_variables
  late int counter;
  // for state
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  // For event
  final _eventStreamController = StreamController<CounterStatus>();
  StreamSink<CounterStatus> get eventCounterSink => _eventStreamController.sink;
  Stream<CounterStatus> get eventCounterStream => _eventStreamController.stream;

  CounterBloc() {
    counter = 0;
    print("counter $counter");
    eventCounterStream.listen((event) {
      if (event == CounterStatus.Increment) {
        counter++;
      } else if (event == CounterStatus.Decrement) {
        counter--;
      } else if (event == CounterStatus.Reset) {
        counter = 0;
      }
    });
  }
}
