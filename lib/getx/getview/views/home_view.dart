import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../controller/user_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // use with extention
    final DateTime dateTime = DateTime.now();
    print("extentionDateTime ${dateTime.humanize}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: controller.obx(
          (data) => ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: data?.results.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "${data?.results[index].picture?.large}"),
                        ),
                        title: Text("${data?.results[index].name?.title}"),
                        subtitle: Text(
                          "${data?.results[index].email}",
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          "${data?.results[index].dob?.age}",
                        ),
                      ),
                    ),
                    InkWell(
                      // onTap: () {
                      //   print("dsaf${data?.results[index].dob?.date}");
                      // },
                      child: Card(
                        child: ListTile(
                          title: Text(
                              "${data?.results[index].location?.street?.number}"),
                          subtitle: Text(
                              "${data?.results[index].location?.street?.name}"),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text("extention one").addBox(),
                          const Text("Add Paddding"),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: const Text("extention").addBox(),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
          onLoading: const Center(
              child: CircularProgressIndicator(backgroundColor: Colors.pink)),
              onEmpty: const Center(
                child: Text("No Data"),
              ),
          onError: (error) {
        if (kDebugMode) {
          print("error $error");
        }
        return Center(
          child: Text(error!),
        );
      }),
    );
  }
}

extension on DateTime {
  String get humanize {
    // you have access to the instance in extension methods via 'this' keyword.
    return "${this.day}/${this.month}/${this.year}";
  }
}

extension on Text {
  dynamic get getColorText {
    return "${this.style!.color!.green}";
  }
}

extension on Widget {
  Container addBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.green,
      child: this,
    );
  }

  Container addBoxPadding() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      color: Colors.green,
      child: this,
    );
  }

  Padding addPadding() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: this,
    );
  }

}
