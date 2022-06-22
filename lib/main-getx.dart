// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
//
// import 'getx/getview/provider/user_provider.dart';
// import 'getx/getview/routes/app_pages.dart';
//
// void main() {
//   // Keyboard keyboard = Keyboard();
//   // print("${keyboard.a()}");
//
//   String rawJson = '{"name":"Mary","age":30}';
//   Map<String, dynamic> map = jsonDecode(rawJson);
//   String name = map['name'];
//   // print("Name $name"); // ==> Mary
//   int age = map['age'];
//   Person person = Person.fromJson(map);
//
//   // print("person ${person.name}"); ==> Mary
//   // Person person = Person.fromJson(map);
//
//   runApp(
//     GetMaterialApp(
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       theme: ThemeData.dark(),
//       debugShowCheckedModeBanner: true,
//     ),
//   );
// }
//
// class Person {
//   String name;
//   int age;
//   Person(this.name, this.age);
//
//   // named constructor
//   Person.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         age = json['age'];
//
//   // method
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//     };
//   }
// }
