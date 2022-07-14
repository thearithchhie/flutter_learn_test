import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Lab10Body extends StatefulWidget {
  const Lab10Body({Key? key}) : super(key: key);

  @override
  _Lab10BodyState createState() => _Lab10BodyState();
}

class _Lab10BodyState extends State<Lab10Body> {

  dynamic size;
  final TextEditingController _textFirstNameController = TextEditingController();
  final TextEditingController _textLastNameController = TextEditingController();

  String? firstName, lastName, result = "";

  @override
  void dispose() {
    _textFirstNameController.dispose();
    _textLastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
     children: [
       Scaffold(
         backgroundColor: Colors.pink,
         appBar: PreferredSize(
             preferredSize: const Size.fromHeight(50.0), // here the desired height
             child: AppBar(
               centerTitle: true,
               title: const Text("Lab10Body"),
             )
         ),
       ),
       Positioned(
         top: size.height * 0.2,
         child: ClipRRect(
           borderRadius: const BorderRadius.all(Radius.circular(20)),
           child: Container(
             width: size.width,
             height: size.height * 0.3,
             decoration: const BoxDecoration(
               color: Colors.pinkAccent
             ),
           ),
         )
       ),
       Positioned(
         top: size.height * 0.24,
         child: Material(
           color: Colors.transparent,
           child: Container(
             padding: const EdgeInsets.all(10),
             width: size.width,
             height: 60,
             child:  TextFormField(
               keyboardType: TextInputType.text,
               controller: _textFirstNameController,
               decoration: const InputDecoration(
                 labelStyle: TextStyle(color: Colors.white),
                 labelText: 'First Name',
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white, width: 1),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white, width: 1),
                 ),
               ),
               onChanged: (value){
                 firstName = value;
                 print("firstName $firstName");
               },
             ),
           ),
         ),
       ),

       Positioned(
         top: size.height * 0.32,
         child: Material(
           color: Colors.transparent,
           child: Container(
             padding: const EdgeInsets.all(10),
             width: size.width,
             height: 60,
             child:  TextFormField(
               keyboardType: TextInputType.text,
               controller: _textLastNameController,
               decoration: const InputDecoration(
                 labelStyle: TextStyle(color: Colors.white),
                 labelText: 'Last Name',
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white, width: 1),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white, width: 1),
                 ),
               ),
               onChanged: (value){
                 lastName = value;
                 print("lastName $lastName");
               },
             ),
           ),
         ),
       ),

       Positioned(
           top: size.height * 0.39,
           child: Material(
             color: Colors.transparent,
             child: Container(
                 margin: const EdgeInsets.only(left:100),
                 child: Text("Result : $result  ", style: const TextStyle(color: Colors.white),)
             )
           )
       ),

       Positioned(
         top: size.height * 0.43,
         child: Material(
           color: Colors.transparent,
           child: Container(
             margin: const EdgeInsets.only(left:100),
             child: CupertinoButton.filled(
                 child:const Text("Save"),
                 onPressed: (){
                   setState(() {
                     result = firstName! +" "+ lastName!;
                   });
                 }
             ),
           ),
         )
       ),

     ],
    );
  }
  void getValue({String? name1, String? name2}) {
    if (kDebugMode) {
      print("name1 $name1");
    }
  }
}
