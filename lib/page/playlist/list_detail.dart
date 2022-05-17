import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/request/play_request.dart';
import 'package:provider/provider.dart';

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
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    data.playAndSongModel.playDetailSongDetailModel?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1),
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Text("?"),
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
