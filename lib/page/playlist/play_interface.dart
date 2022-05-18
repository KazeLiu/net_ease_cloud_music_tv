import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/main.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/play_and_song_model.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';
import '../../provider/play_provider.dart';
import '../../request/play_request.dart';

class PlayInterface extends StatefulWidget {
  PlayInterface({Key? key, required this.songIndex}) : super(key: key);
  static String routerName = "/playController";
  int songIndex;

  @override
  State<PlayInterface> createState() => _PlayInterfaceState();
}

class _PlayInterfaceState extends State<PlayInterface> {
  var kazePlayer = MyApp.kazePlayer;
  PlayDetailSongDetailModel model = PlayDetailSongDetailModel();

  @override
  initState() {
    // 判断是否在播放 在播放就不请求 没播放就请求播放
    _playOneSong();
    // _getSongListen();
    super.initState();
  }

//  加载单首歌
  _playOneSong() async {
    var playProvider = Provider.of<PlayProvider>(context, listen: false);
    model = playProvider
        .playAndSongModel.playDetailSongDetailModel![widget.songIndex];
    playProvider.playingSongData = model;
    await kazePlayer.setUrl(model.playUrl!);
  }

//  加载歌单
  _playListSong() async {}

  //  监听
  _getSongListen() {
    kazePlayer.playerStateStream.listen((state) {
      print(state.playing.toString());
      print(state.processingState.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayProvider>(
      builder: (ctx, data, _) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    model.songName!,
                    style: KazeFontStyles.text36CW,
                  ),
                  Text(
                    '${model.songAuthorName} - ${model.songAlbum}',
                    style: KazeFontStyles.text20C,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          model.songImage!,
                        ),
                      ),
                    ),
                  ),
                  // Expanded(flex: 1, child: Text("歌词"))
                ],
              ),
              // const SizedBox(
              //   height: 40,
              // ),
              // Text("评论")
              // Row(
              //   children: [
              //     ElevatedButton(
              //         onPressed: () async {
              //           await kazePlayer.play();
              //         },
              //         child: Text("播放")),
              //     ElevatedButton(
              //         onPressed: () async {
              //           await kazePlayer.pause();
              //         },
              //         child: Text("暂停")),
              //     ElevatedButton(
              //         onPressed: () async {
              //           await kazePlayer.stop();
              //         },
              //         child: Text("停止")),
              //     ElevatedButton(
              //         onPressed: () async {
              //           await kazePlayer.seek(Duration(milliseconds: 1200));
              //         },
              //         child: Text("跳几秒")),
              //   ],
              // )
            ],
          ),
        );
      },
    );
  }
}
