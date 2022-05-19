import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/play_detail_model.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/play_listen_model.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/song_detail_model.dart';

import '../model/playlist/play_and_song_model.dart';
import '../tool/common.dart';

class PlayProvider with ChangeNotifier {
  //  歌单和歌曲信息
  PlayAndSongModel _playAndSongModel = PlayAndSongModel();

  PlayAndSongModel get playAndSongModel => _playAndSongModel;

  set playAndSongModel(PlayAndSongModel value) {
    _playAndSongModel = value;
    notifyListeners();
  }

  setPlayAndSongModel(PlayDetailModel playDetailModel,
      SongDetailModel songDetailModel, PlayListenModel playListenModel) {
    _playAndSongModel.playlistName = playDetailModel.playlist?.name;
    _playAndSongModel.playlistAuthorName =
        playDetailModel.playlist?.creator?.nickname;
    _playAndSongModel.playlistAuthorImage =
        playDetailModel.playlist?.creator?.avatarUrl;
    _playAndSongModel.playlistCreateTime = DateTime.fromMillisecondsSinceEpoch(
            playDetailModel.playlist!.createTime!)
        .toString();
    _playAndSongModel.playlistDescription =
        playDetailModel.playlist?.description;
    _playAndSongModel.playlistNumber = playDetailModel.playlist?.trackCount;
    _playAndSongModel.playlistImage = playDetailModel.playlist?.coverImgUrl;
    _playAndSongModel.playlistTag = playDetailModel.playlist?.tags;
    _playAndSongModel.playDetailSongDetailModel = [];
    songDetailModel.songs?.forEach((songDetail) {
      PlayDetailSongDetailModel playDetailSongDetailModel =
          PlayDetailSongDetailModel();
      playDetailSongDetailModel.songID = songDetail.id!;
      playDetailSongDetailModel.songAlbum = songDetail.cd;
      playDetailSongDetailModel.songAuthorName =
          songDetail.ar?.map((e) => e.name).join("/");
      playDetailSongDetailModel.songImage = songDetail.al?.picUrl;
      playDetailSongDetailModel.songAlia = (songDetail.alia != null &&
              songDetail.alia!.isNotEmpty &&
              songDetail.alia![0] != songDetail.name)
          ? songDetail.alia![0]
          : "";
      playDetailSongDetailModel.songName = songDetail.name;
      playDetailSongDetailModel.playUrl = playListenModel.data == null
          ? ""
          : playListenModel.data!
              .firstWhere((song) => song.id == playDetailSongDetailModel.songID)
              .url;
      playDetailSongDetailModel.songTime =
          KazeCommon.durationTransform(songDetail.dt! ~/ 1000);
      _playAndSongModel.playDetailSongDetailModel!
          .add(playDetailSongDetailModel);
    });
    notifyListeners();
  }

  //  歌曲信息
  PlayListenModel _playListenModel = PlayListenModel();

  PlayListenModel get playListenModel => _playListenModel;

  set playListenModel(PlayListenModel value) {
    _playListenModel = value;
    notifyListeners();
  }

  //  当前播放的歌曲信息
  PlayDetailSongDetailModel _playingSongData = PlayDetailSongDetailModel();

  PlayDetailSongDetailModel get playingSongData => _playingSongData;

  set playingSongData(PlayDetailSongDetailModel value) {
    _playingSongData = value;

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
