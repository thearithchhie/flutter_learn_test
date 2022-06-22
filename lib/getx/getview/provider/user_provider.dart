import 'package:flutter_learn_test/getx/getview/model/user_model.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<UserModel> getUser() async {
    // https://randomuser.me/api/?results
    final response = await get('https://randomuser.me/api/?results');
    if (response.status.hasError) {
      return Future.error(response.statusText ?? "");
    } else {
      // print("responseBody ${response.body['results']}");
      return userModelFromJson(response.bodyString ?? "");
    }
  }
}
