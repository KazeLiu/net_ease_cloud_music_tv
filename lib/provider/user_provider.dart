import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/model/user/user_account_model.dart';
import 'package:net_ease_cloud_music_tv/model/user/user_playlist_model.dart';

class UserProvider with ChangeNotifier {
  //  用户信息
  UserAccountModel _userAccountModel = UserAccountModel();

  UserAccountModel get userAccountModel => _userAccountModel;

  set userAccountModel(UserAccountModel value) {
    _userAccountModel = value;
    notifyListeners();
  }

  //  用户订阅的歌单
  UserPlaylistModel _userPlaylistModel = UserPlaylistModel();
  UserPlaylistModel _userPlaylistModelType = UserPlaylistModel();

  UserPlaylistModel get userPlaylistModel => _userPlaylistModel;
  UserPlaylistModel get userPlaylistModelType => _userPlaylistModelType;

  setUserPlaylistModelInType(type, userID) {
    // type == 0 喜欢的音乐 type == 1 创建的歌单 type == 2 收藏的歌单
    _userPlaylistModelType = _userPlaylistModel;
    var playList = _userPlaylistModel.playlist
        ?.where((element) => element.userId == userID)
        .toList();
    if (playList != null) {
      if (type == 0) {
        // _userPlaylistModelType.playlist = [playList[0]];
      } else if (type == 1) {
        _userPlaylistModelType.playlist = playList;
      } else if (type == 2) {
        _userPlaylistModelType.playlist = _userPlaylistModel.playlist
            ?.where((element) => element.userId != userID)
            .toList();
      }
      notifyListeners();
    }
  }

  set userPlaylist(UserPlaylistModel value) {
    _userPlaylistModel = value;
    notifyListeners();
  }
}
