import 'package:flutter/material.dart';


// learn from : https://betterprogramming.pub/flutter-keys-the-why-when-and-how-to-go-about-them-85f12a5a0445

class TestConcept extends StatefulWidget {
  TestConcept({Key? key}) : super(key: key);

  @override
  State<TestConcept> createState() => _TestConceptState();
}

final formKey = GlobalKey<FormState>();

class _TestConceptState extends State<TestConcept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Keys'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            //assign the globalkey to the key value of the form widget
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  validator: ((value) {
                    if (value == null) {
                      return 'Invalid value';
                    }
                    if (value.isEmpty) {
                      return 'Empty value';
                    }
                    return null;
                  }),
                ),
                TextFormField(
                  validator: ((value) {
                    if (value == null) {
                      print("Invalid value");
                      return 'Invalid value';
                    }
                    if (value.isEmpty) {
                      return 'Empty value';
                    }
                    return null;
                  }),
                ),
                Container(
                  color: Colors.pink,
                  child: TextButton(
                      onPressed: () {
                        //access the Form widgets variables and functions
                        //in this case we use the validate() method
                        if (!formKey.currentState!.validate()) {
                          print('error in the form');
                          return;
                        }
                      },
                      child: const Text(
                        'Validate',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
