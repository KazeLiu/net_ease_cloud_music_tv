import 'package:flutter/cupertino.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/play_detail_model.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/song_detail_model.dart';

import '../model/playlist/play_and_song_model.dart';

class PlayProvider with ChangeNotifier {
  //  用户信息
  PlayAndSongModel _playAndSongModel = PlayAndSongModel();

  PlayAndSongModel get playAndSongModel => _playAndSongModel;

  set playAndSongModel(PlayAndSongModel value) {
    _playAndSongModel = value;
    notifyListeners();
  }

  setPlayAndSongModel(
      PlayDetailModel playDetailModel, SongDetailModel songDetailModel) {
    _playAndSongModel.playlistName = playDetailModel.playlist?.name;
    _playAndSongModel.playlistAuthorName =
        playDetailModel.playlist?.creator?.nickname;
    _playAndSongModel.playlistCreateTime =
        playDetailModel.playlist?.createTime.toString();
    _playAndSongModel.playlistDescription =
        playDetailModel.playlist?.description;
    _playAndSongModel.playlistNumber = playDetailModel.playlist?.trackCount;
    _playAndSongModel.playlistTag = playDetailModel.playlist?.tags;
    _playAndSongModel.playDetailSongDetailModel = [];
    songDetailModel.songs?.forEach((soneDetail) {
      PlayDetailSongDetailModel playDetailSongDetailModel =
          PlayDetailSongDetailModel();
      playDetailSongDetailModel.songID = soneDetail.id!;
      playDetailSongDetailModel.songAlbum = soneDetail.cd;
      playDetailSongDetailModel.songAuthorName = soneDetail.al?.name;
      playDetailSongDetailModel.songImage = soneDetail.al?.picUrl;
      playDetailSongDetailModel.songAlia =
          (soneDetail.alia != null && soneDetail.alia!.isNotEmpty)
              ? soneDetail.alia![0]
              : "";
      playDetailSongDetailModel.songName = soneDetail.name;
      playDetailSongDetailModel.songTime = soneDetail.dt.toString();
      _playAndSongModel.playDetailSongDetailModel!
          .add(playDetailSongDetailModel);
    });
    notifyListeners();
  }
}
