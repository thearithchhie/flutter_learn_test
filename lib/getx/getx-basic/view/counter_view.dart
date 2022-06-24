import 'package:flutter/material.dart';
import 'package:flutter_learn_test/getx/getx-basic/controller/counter_controller.dart';
import 'package:get/get.dart';

class CounterViewGetXBasic extends StatefulWidget {
  const CounterViewGetXBasic({Key? key}) : super(key: key);

  @override
  _CounterViewGetXBasicState createState() => _CounterViewGetXBasicState();
}

class _CounterViewGetXBasicState extends State<CounterViewGetXBasic> {
  final CounterControllerGetXBasic  _controllerGetXBasic = CounterControllerGetXBasic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CounterViewGetXBasic")),
      body: Row(
        children: [
          SizedBox(
            child: Obx(() {
                return Text("${_controllerGetXBasic.count}", style: const TextStyle(color: Colors.white));
              },
            ),
          ),
          InkWell(
            onTap: () => _controllerGetXBasic.count,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          )
        ],
      ),
    );
  }
}
