import 'package:flutter/material.dart';
import 'package:flutter_learn_test/provider/view_model/provider_counter_viewmodel.dart';
import 'package:provider/provider.dart';
/// Learn From : https://samderlust.com/dev-blog/flutter-dart/flutter-the-use-of-selector-in-provider-package
class ConsummerScreen extends StatefulWidget {
  ConsummerScreen({Key? key}) : super(key: key);

  @override
  State<ConsummerScreen> createState() => _ConsummerScreenState();
}

class _ConsummerScreenState extends State<ConsummerScreen> {
  @override
  Widget build(BuildContext context) {
    print('build home');
    return Container(
      child: Scaffold(
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: 'all',
              onPressed: () {
                context.read<CounterProvider>().add();
              },
              child: Text('all'),
            ),
            FloatingActionButton(
              heroTag: '1',
              onPressed: () {
                context.read<CounterProvider>().addTo1();
              },
              child: Text('1'),
            ),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () {
                context.read<CounterProvider>().addTo2();
              },
              child: Text('2'),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Selector<CounterProvider, int>(
                      selector: (_, provider) => provider.number1,
                      builder: (context, number1, child) {
                        print('Build num1');
                        return Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(10),
                          child: Text('$number1'),
                        );
                      }),
                  Selector<CounterProvider, int>(
                      selector: (_, provider) => provider.number2,
                      builder: (context, number2, child) {
                        print('Build num2');
                        return Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(10),
                          child: Text('$number2'),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}