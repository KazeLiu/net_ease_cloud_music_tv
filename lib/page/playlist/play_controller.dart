import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
  int nowTime = 0;
  int allTime = 0;
  Duration buffered = const Duration(seconds: 0);
  List<PlayDetailSongDetailModel> playList = [];

  _init() {
    MyApp.kazePlayer.playerStateStream.listen((state) {
      setState(() {
        playState = state.playing;
        if (MyApp.kazePlayer.duration != null) {
          int seconds = MyApp.kazePlayer.duration!.inSeconds;
          allTime = seconds;
        }
      });
    });

    // buffered
    MyApp.kazePlayer.positionStream.listen((time) {
      setState(() {
        nowTime = time.inSeconds;
        buffered = MyApp.kazePlayer.bufferedPosition;
      });
    });

    MyApp.kazePlayer.currentIndexStream.listen((index) {
      var playProvider = Provider.of<PlayProvider>(context, listen: false);
      if (index != null &&
          playProvider.playAndSongModel.playDetailSongDetailModel != null) {
        playProvider.playingSongData =
            playProvider.playAndSongModel.playDetailSongDetailModel![index];
        playList = playProvider.playAndSongModel.playDetailSongDetailModel!;
      }
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // 判断路由
                              Route? _route;
                              // MyApp.navigatorKey.currentState
                              //     ?.popUntil((route) {
                              //   _route = route;
                              //   return true;
                              // });
                              // print(_route?.settings.name);
                              MyApp.navigatorKey.currentState?.pushNamed(
                                  PlayInterface.routerName,
                                  arguments: -1);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 75,
                                    child: Image.network(data.songImage!)),
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
                            children: [
                              _PlayControllerBtn(data),
                              ProgressBar(
                                progress: Duration(seconds: nowTime),
                                buffered: buffered,
                                total: Duration(seconds: allTime),
                                progressBarColor: Colors.red,
                                baseBarColor: Colors.white.withOpacity(0.24),
                                bufferedBarColor:
                                    Colors.white.withOpacity(0.24),
                                thumbColor: Colors.white,
                                barHeight: 3.0,
                                thumbRadius: 5.0,
                                timeLabelLocation: TimeLabelLocation.sides,
                                onSeek: (duration) {
                                  MyApp.kazePlayer.seek(duration);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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

  _PlayControllerBtn(playingSongData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.loop)),
        IconButton(
            onPressed: () {
              MyApp.kazePlayer.seekToPrevious();
            },
            icon: const Icon(Icons.skip_previous)),
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
        IconButton(
            onPressed: () {
              MyApp.kazePlayer.seekToNext();
            },
            icon: const Icon(Icons.skip_next_sharp)),
        IconButton(
            onPressed: () {
              SmartDialog.show(
                alignment: Alignment.centerRight,
                maskColor: Colors.transparent,
                builder: (_) {
                  return Container(
                      height: double.infinity,
                      width: 300,
                      padding: const EdgeInsets.all(8),
                      color: const Color(0xFF373737),
                      alignment: Alignment.centerRight,
                      child: ListView(
                        children: List.generate(playList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              MyApp.kazePlayer.seek(
                                  const Duration(milliseconds: 0),
                                  index: index);
                            },
                            child: ListTile(
                                leading: playList[index].songID ==
                                        playingSongData.songID
                                    ? const Icon(Icons.surround_sound,color: Color(0xFFF44336),)
                                    : const Icon(Icons.surround_sound),
                                title: Text(
                                  playList[index].songName!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  playList[index].songAuthorName!,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          );
                        }),
                      ));
                },
              );
            },
            icon: const Icon(Icons.list_rounded)),
      ],
    );
  }
}
