import 'package:flutter/foundation.dart';
import 'package:flutter_learn_test/getx/getview/model/user_model.dart';
import 'package:get/get.dart';

import '../provider/user_provider.dart';

class HomeController extends GetxController with StateMixin<UserModel> {
  @override
  void onInit() {
    super.onInit();
    final UserProvider _userProvider = UserProvider();
    _userProvider.getUser().then((UserModel response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      if (kDebugMode) {
        // kDebugMode = always return true
        print("HomeController $err");
      }
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }
}
