import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/main.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/play_interface.dart';
import 'package:net_ease_cloud_music_tv/tool/common.dart';
import 'package:provider/provider.dart';

import '../../model/playlist/play_and_song_model.dart';
import '../../provider/play_provider.dart';
import '../../tool/color.dart';

class PlayController extends StatefulWidget {
  const PlayController({Key? key}) : super(key: key);
  static String routerName = "/playController";

  @override
  State<PlayController> createState() => _PlayControllerState();
}

class _PlayControllerState extends State<PlayController> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  bool playState = false;
  String nowTime = "00:00:00";
  String allTime = "00:00:00";

  _init() {
    MyApp.kazePlayer.playerStateStream.listen((state) {
      setState(() {
        playState = state.playing;
        if (MyApp.kazePlayer.duration != null) {
          int seconds = MyApp.kazePlayer.duration!.inSeconds;
          allTime = KazeCommon.durationTransform(seconds, type: 1);
        }
      });
    });

    MyApp.kazePlayer.positionStream.listen((time) {
      setState(() {
        nowTime = KazeCommon.durationTransform(time.inSeconds, type: 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PlayProvider, PlayDetailSongDetailModel>(
      selector: (context, model) => model.playingSongData,
      builder: (ctx, data, _) {
        if (data.songName == null) {
          return Container(
            width: double.infinity,
            color: Colors.black87,
            height: 100,
            child: const Center(child: Text("请先选择歌曲")),
          );
        } else {
          return Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.red,
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // 判断路由
                          Route? _route;
                          MyApp.navigatorKey.currentState?.popUntil((route) {
                            _route = route;
                            return true;
                          });
                          print(_route?.settings.name);
                          MyApp.navigatorKey.currentState?.pushNamed(
                              PlayInterface.routerName,
                              arguments: -1);
                        },
                        child: Row(
                          children: [
                            Image.network(data.songImage!),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.songName!,
                                  style: KazeFontStyles.text20CW,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  '${data.songAuthorName}',
                                  style: KazeFontStyles.text16CW,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _PlayControllerBtn(),
                          // Text("进度条"),
                          Text("${nowTime}/${allTime}")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  _PlayControllerBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.loop)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.skip_previous)),
        !playState
            ? IconButton(
                onPressed: () {
                  MyApp.kazePlayer.play();
                },
                icon: const Icon(Icons.play_arrow))
            : IconButton(
                onPressed: () {
                  MyApp.kazePlayer.pause();
                },
                icon: const Icon(Icons.pause)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.skip_next_sharp)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.list_rounded)),
      ],
    );
  }
}
