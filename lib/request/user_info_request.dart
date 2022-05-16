import 'dart:math';

import 'package:net_ease_cloud_music_tv/model/user/user_account_model.dart';

import 'main.dart';

class UserInfoRequest {
  static getUserDetail() async {
    final url = "/user/account?${Random().nextInt(100000).toString()}";
    print("请求用户信息");
    ResponseData data = await HttpClass.get(url);
    if (!data.error) {
      return UserAccountModel.fromJson(data.data);
    } else {
      return UserAccountModel();
    }
  }
}
