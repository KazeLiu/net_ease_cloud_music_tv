import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/play_interface.dart';
import 'package:net_ease_cloud_music_tv/request/play_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';

import '../../model/playlist/play_and_song_model.dart';
import '../../model/playlist/play_detail_model.dart';
import '../../model/playlist/play_listen_model.dart';
import '../../model/playlist/song_detail_model.dart';
import '../../provider/play_provider.dart';

class ListDetail extends StatefulWidget {
  ListDetail({Key? key, required this.playListId}) : super(key: key);
  static String routerName = "/listDetail";

  @override
  State<ListDetail> createState() => _ListDetailState();
  int playListId;
}

class _ListDetailState extends State<ListDetail> {
  @override
  initState() {
    _loadListDetail();
    super.initState();
  }

  _loadListDetail() async {
    var playProvider = Provider.of<PlayProvider>(context, listen: false);
    // 获取歌单
    PlayDetailModel playDetail =
        await PlayRequest.getPlayDetail(widget.playListId);
    SongDetailModel songDetail = SongDetailModel();
    PlayListenModel playListenModel = PlayListenModel();
    // 歌单内歌曲IDS
    List<int?>? list = playDetail.playlist?.trackIds?.map((e) => e.id).toList();
    if (list != null && list.isNotEmpty) {
      songDetail = await PlayRequest.getSongDetail(list.join(','));
      playListenModel = await PlayRequest.getListenUrl(list.join(','));
    }
    // 绑定 歌单 歌曲 播放的URL
    playProvider.setPlayAndSongModel(playDetail, songDetail, playListenModel);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PlayProvider, PlayAndSongModel>(
      selector: (ctx, select) => select.playAndSongModel,
      shouldRebuild: (_old, _new) => true,
      builder: (ctx, data, _) {
        if (data.playlistImage == null) {
          return const Center(
              child: Text(
            "加载中……",
            style: KazeFontStyles.text20C,
          ));
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 130,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.network(data.playlistImage!),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.playlistName!,
                                style: KazeFontStyles.text30CW,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data.playlistAuthorImage!),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('创建人：${data.playlistAuthorName}',
                                      style: KazeFontStyles.text20C),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text('创建时间：${data.playlistCreateTime}',
                                  style: KazeFontStyles.text18C),
                              const SizedBox(
                                height: 2,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              SmartDialog.show(
                                alignment: Alignment.center,
                                clickMaskDismiss: false,
                                maskColor: const Color(0xFF424242),
                                builder: (_) {
                                  return Container(
                                    color: Colors.black,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "歌单描述",
                                          style: KazeFontStyles.text30C,
                                        ),
                                        Container(
                                          height: 3,
                                          color: const Color(0xFFE60026),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${data.playlistDescription == "" || data.playlistDescription == null ? "‘他貌似什么都没写呢’" : data.playlistDescription}',
                                                style: KazeFontStyles.text16C,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            SmartDialog.dismiss();
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("关闭"),
                                          ),
                                          style: KazeButtonStyle.buttonStyle,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            style: KazeButtonStyle.buttonStyle,
                            icon: const Icon(Icons.description),
                            label: const Text("查看描述"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    PlayInterface.routerName,
                                    arguments: 0);
                              },
                              style: KazeButtonStyle.buttonStyle,
                              icon: const Icon(Icons.play_circle_fill),
                              label: const Text("播放全部")),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: data == null
                    ? Container()
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: data.playDetailSongDetailModel?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 1),
                        itemBuilder: (ctx, index) {
                          PlayDetailSongDetailModel playDetailSongDetailModel =
                              data.playDetailSongDetailModel![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  PlayInterface.routerName,
                                  arguments: index);
                            },
                            child: Card(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            playDetailSongDetailModel
                                                .songImage!,
                                          ),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center
                                          // 完全填充
                                          ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(1.0),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.9),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.8),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.2),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.1),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.1),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.1),
                                          const Color(0xFF2C2C2C)
                                              .withOpacity(0.1),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          playDetailSongDetailModel.songTime!,
                                          style: KazeFontStyles.text26C,
                                        ),
                                        Text(
                                            playDetailSongDetailModel.songName!,
                                            style: KazeFontStyles.text20CW,
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3),
                                        Text(
                                            playDetailSongDetailModel
                                                .songAuthorName!,
                                            style: KazeFontStyles.text18C,
                                            softWrap: true,
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1),
                                        playDetailSongDetailModel.songAlia == ""
                                            ? Container()
                                            : Text(
                                                playDetailSongDetailModel
                                                    .songAlia!,
                                                style: KazeFontStyles.text16C,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                maxLines: 1),
                                      ],
                                    ),
                                    alignment: Alignment.bottomLeft,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
