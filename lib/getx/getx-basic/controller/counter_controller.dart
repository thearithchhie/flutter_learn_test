import 'package:get/get.dart';

class CounterControllerGetXBasic extends GetxController {
  int count = 0.obs as int;

  void sum(){
    count++;
  }
}