import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/request/play_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';

import '../../model/playlist/play_and_song_model.dart';
import '../../model/playlist/play_detail_model.dart';
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
    PlayDetailModel playDetail =
        await PlayRequest.getPlayDetail(widget.playListId);
    SongDetailModel songDetail = SongDetailModel();
    List<int?>? list = playDetail.playlist?.trackIds?.map((e) => e.id).toList();
    if (list != null && list.isNotEmpty) {
      songDetail = await PlayRequest.getSongDetail(list.join(','));
    }
    playProvider.setPlayAndSongModel(playDetail, songDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayProvider>(
      builder: (ctx, data, _) {
        return Column(
          children: [
            Row(
              children: [Text("???")],
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount:
                    data.playAndSongModel.playDetailSongDetailModel?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1),
                itemBuilder: (ctx, index) {
                  PlayDetailSongDetailModel playDetailSongDetailModel =
                      data.playAndSongModel.playDetailSongDetailModel![index];
                  return Card(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  playDetailSongDetailModel.songImage!,
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
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF2C2C2C).withOpacity(1.0),
                                const Color(0xFF2C2C2C).withOpacity(0.9),
                                const Color(0xFF2C2C2C).withOpacity(0.8),
                                const Color(0xFF2C2C2C).withOpacity(0.2),
                                const Color(0xFF2C2C2C).withOpacity(0.1),
                                const Color(0xFF2C2C2C).withOpacity(0.1),
                                const Color(0xFF2C2C2C).withOpacity(0.1),
                                const Color(0xFF2C2C2C).withOpacity(0.1),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Positioned(
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(playDetailSongDetailModel.songName!,
                                        style: KazeFontStyles.text30CW,
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3),
                                    Text(
                                        playDetailSongDetailModel
                                            .songAuthorName!,
                                        style: KazeFontStyles.text26C,
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1),
                                    Text(playDetailSongDetailModel.songAlia!,
                                        style: KazeFontStyles.text20C,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        maxLines: 1),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                ),
                                Text(playDetailSongDetailModel.songTime!),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
