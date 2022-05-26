import 'package:flutter/material.dart';

import 'counter_bloc.dart';

class CounterUiBloc extends StatefulWidget {
  const CounterUiBloc({Key? key}) : super(key: key);

  @override
  State<CounterUiBloc> createState() => _CounterUiBlocState();
}

class _CounterUiBlocState extends State<CounterUiBloc> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Counter Ui Bloc"),
        backgroundColor: const Color.fromARGB(255, 57, 204, 248),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: StreamBuilder(
                stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text("${snapshot.data}");
                },
              ),
            ),
            const SizedBox(height: 10),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        counterBloc.eventCounterSink.add(CounterStatus.Increment);
                      },
                      child: const Icon(Icons.plus_one_outlined),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        counterBloc.eventCounterSink.add(CounterStatus.Decrement);
                      },
                      child: const Icon(Icons.minimize),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                       counterBloc.eventCounterSink.add(CounterStatus.Reset);
                    },
                    child: const Icon(Icons.restart_alt_outlined),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
