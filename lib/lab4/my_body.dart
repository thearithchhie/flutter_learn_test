import 'package:flutter/material.dart';

class MyBodyApp extends StatefulWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  State<MyBodyApp> createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {
  List<String> list = [];
  TextEditingController textAdd = TextEditingController();
  bool status = false;

  _onChanged(String value) {
    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: textAdd,
              decoration: InputDecoration(
                labelText: 'Add Item',
                hintText: 'Enter your item',
                suffixIcon: Visibility(
                  visible: status,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        list.add(textAdd.text);
                        textAdd.clear();
                        status = false;
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                )
              ),
              onChanged: _onChanged
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                list.add(textAdd.text);
                textAdd.clear();
                status = false;
              });
            },
            child: Container(
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.pink, borderRadius: BorderRadius.circular(10)),
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          list[index],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.pink
                          ),
                        )),
                        const Icon(Icons.arrow_forward_ios, color: Colors.pink)
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
