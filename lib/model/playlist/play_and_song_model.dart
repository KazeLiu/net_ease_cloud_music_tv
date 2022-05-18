class PlayAndSongModel {
  //  名称
  String? playlistName;

  //  创建人
  String? playlistAuthorName;

  //  创建人头像
  String? playlistAuthorImage;

  //  创建时间
  String? playlistCreateTime;

  //  描述
  String? playlistDescription;

  //  tag
  List<String>? playlistTag;

  //  数量
  int? playlistNumber;

  //  图片
  String? playlistImage;

  //  歌曲列表
  List<PlayDetailSongDetailModel>? playDetailSongDetailModel;
}

class PlayDetailSongDetailModel {
  //  ID
  late int songID;

  //  图片地址
  String? songImage;

  //  名称
  String? songName;

  //  作者
  String? songAuthorName;

  //  专辑
  String? songAlbum;

  //  副标题
  String? songAlia;

  //  时长
  String? songTime;

  //  播放地址
  String? playUrl;
}
