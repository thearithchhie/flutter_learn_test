// learn from : https://petercoding.com/flutter/2021/03/19/using-shared-preferences-in-flutter/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn_test/shared_preferences/payment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceCounter extends StatefulWidget {
  final String? title;
  SharedPreferenceCounter({this.title,Key? key}) : super(key: key);

  @override
  _SharedPreferenceCounterState createState() => _SharedPreferenceCounterState();
}

class _SharedPreferenceCounterState extends State<SharedPreferenceCounter> {

  int _counter = 0;
  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
      preferences?.setInt("counter", _counter);
    });
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
    preferences?.setString("name", "Peter");
    preferences?.setStringList("infoList", ["developer", "mobile dev"]);
    await storingPayment();
    await removeCouter();
  }

  Future<void> storingPayment() async {
    Payment payment = Payment(accountName: "Peter", accountNumber: 123);
    String storePayment = jsonEncode(payment.toJson());
    await preferences?.setString('payment', storePayment);
    await retrievePayment();
  }

  Future<void> retrievePayment() async {
    String? result = preferences?.getString("payment");
    print("$result");
    Map<String, dynamic> decoded = jsonDecode(result!);
    print(Payment.fromJson(decoded).accountName);
  }

  Future<bool> removePayment() async{
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    return preferences.remove("payment");
  }

  Future<dynamic> removeCouter() async{
    SharedPreferences preferences  = await SharedPreferences.getInstance();
    print("_counter $_counter");
    return preferences.remove("counter");
  }

  @override
  Widget build(BuildContext context) {
    print("Build function");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'The user ${preferences?.getString(
                  "name")} pushed the button this many times:',
            ),
            Text(
              '${preferences?.getInt("counter") ?? 0}',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  print("_counter $_counter");
                  _counter++;
                });
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
