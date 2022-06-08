import 'package:flutter/material.dart';

class MyBodyAppLab5 extends StatefulWidget {
  const MyBodyAppLab5({Key? key}) : super(key: key);

  @override
  State<MyBodyAppLab5> createState() => _MyBodyAppLab5State();
}

class _MyBodyAppLab5State extends State<MyBodyAppLab5> {
  List<String> list = [];
  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();
  bool status = false;
  
  double firstFieldValue = 0;
  double secondFieldValue = 0;
  double totalValue = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
                controller: textBox1,
                decoration: const InputDecoration(
                    labelText: 'Add Item',
                    hintText: 'Enter your item',
                ),
                onChanged: (value){
                  if(value.isEmpty){
                    setState(() => firstFieldValue = 0);
                  }else{
                    setState((){
                      firstFieldValue = double.parse(value);
                    });
                  }
                }
            ),
          ),
           Container(
             padding: const EdgeInsets.all(10),
             child: TextFormField(
                 controller: textBox2,
                 decoration: const InputDecoration(
                     labelText: 'Add Item',
                     hintText: 'Enter your item',
                 ),
                 onChanged: (value){
                   if(value.isEmpty){
                     setState(() => secondFieldValue = 0);
                   }else{
                     setState((){
                       secondFieldValue = double.parse(value);
                     });
                   }
                 }
             ),
           ),
          // InkWell(
          //   onTap: () {
          //     setState(() {
          //       totalValue = firstFieldValue + secondFieldValue;
          //     });
          //   },
          //   child: Container(
          //     width: 90,
          //     height: 40,
          //     decoration: BoxDecoration(
          //         color: Colors.pink, borderRadius: BorderRadius.circular(10)),
          //     child: const Align(
          //         alignment: Alignment.center,
          //         child: Text(
          //           "Sum",
          //           style: TextStyle(fontSize: 20, color: Colors.white),
          //         )),
          //   ),
          // ),
          const SizedBox(height: 10),
           // Text(
           //     "${firstFieldValue + secondFieldValue}"
           // )
           // Text(
           //   "$totalValue",
           //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           // ),
           Text(
               "${firstFieldValue + secondFieldValue}",
             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           )
        ],
      ),
    );
  }
}
