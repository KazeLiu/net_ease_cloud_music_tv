import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
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
    if (widget.songIndex != -1) {
      _playListSong();
    } else {}
    super.initState();
  }

  // 加载歌单
  _playListSong() async {
    var playProvider = Provider.of<PlayProvider>(context, listen: false);
    var playDetailSongDetailModelList =
        playProvider.playAndSongModel.playDetailSongDetailModel!;
    await kazePlayer.setAudioSource(
      ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: List.generate(playDetailSongDetailModelList.length, (index) {
          var playInfo = playDetailSongDetailModelList[index];
          return AudioSource.uri(
            Uri.parse(playInfo.playUrl == null ? "" : playInfo.playUrl!),
            tag: MediaItem(
              id: playInfo.songID.toString(),
              // Metadata to display in the notification:
              album: playInfo.songAlbum,
              title: playInfo.songName!,
              artUri: Uri.parse(playInfo.songImage!),
            ),
          );
        }),
      ),
      initialIndex: widget.songIndex, // default
    );
    await kazePlayer.setLoopMode(LoopMode.all);
    playProvider.playingSongData =
        playDetailSongDetailModelList[widget.songIndex];
    kazePlayer.play();
  }

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
                          child: Image.network(data.songImage!),
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
