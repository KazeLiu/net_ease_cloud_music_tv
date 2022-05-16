import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/model/user/user_account_model.dart';

class UserProvider with ChangeNotifier {
  //  用户信息
  UserAccountModel _userAccountModel = UserAccountModel();

  UserAccountModel get userAccountModel => _userAccountModel;

  set userAccountModel(UserAccountModel value) {
    _userAccountModel = value;
    notifyListeners();
  }
//
// //  用户订阅的歌单
//   UserPlaylist _userPlaylist = UserPlaylist();
//
//   UserPlaylist get userPlaylist => _userPlaylist;
//
//   set userPlaylist(UserPlaylist value) {
//     _userPlaylist = value;
//     notifyListeners();
//   }
}
