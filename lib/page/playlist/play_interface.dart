import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/main.dart';
import 'package:net_ease_cloud_music_tv/model/playlist/play_and_song_model.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';
import '../../provider/play_provider.dart';
import '../../request/play_request.dart';

class PlayInterface extends StatefulWidget {
  PlayInterface({Key? key, required this.songIndex}) : super(key: key);
  static String routerName = "/playInterface";
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
    if (kazePlayer.playerState.playing) {
    } else {
      _playOneSong();
    }
    // _getSongListen();
    super.initState();
  }

//  加载单首歌
  _playOneSong() async {
    var playProvider = Provider.of<PlayProvider>(context, listen: false);
    playProvider.playingSongData = playProvider
        .playAndSongModel.playDetailSongDetailModel![widget.songIndex];
    await kazePlayer.setUrl(model.playUrl!);
    await kazePlayer.play();
  }

//  加载歌单
  _playListSong() async {}

  @override
  Widget build(BuildContext context) {
    return Selector<PlayProvider, PlayDetailSongDetailModel>(
      selector: (ctx, data) => data.playingSongData,
      shouldRebuild: (oldData, newData) => true,
      builder: (ctx, data, _) => data.songImage == null
          ? const Center(
              child: Text("loading"),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        data.songName!,
                        style: KazeFontStyles.text36CW,
                      ),
                      Text(
                        '${data.songAuthorName} - ${data.songAlbum}',
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
                              data.songImage!,
                            ),
                          ),
                        ),
                      ),
                      // Expanded(flex: 1, child: Text("歌词"))
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
