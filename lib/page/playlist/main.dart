import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/model/user/user_account_model.dart';
import 'package:net_ease_cloud_music_tv/model/user/user_playlist_model.dart';
import 'package:net_ease_cloud_music_tv/request/user_info_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';

class PlayList extends StatefulWidget {
  PlayList({Key? key, required this.listType}) : super(key: key);
  static String routerName = "/playlist";
  int? listType;

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  @override
  initState() {
    _getIDList();
    super.initState();
  }

  _getIDList() async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    UserAccountModel userAccountModel = userProvider.userAccountModel;
    UserPlaylistModel userPlaylistModel =
        await UserInfoRequest.getUserPlayList(userAccountModel.account?.id);
    userProvider.userPlaylist = userPlaylistModel;
    userProvider.setUserPlaylistModelInType(1, userAccountModel.account?.id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (ctx, data, _) {
        return Column(
          children: [
            // title
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Text(
                    "我创建的歌单",
                    style: KazeFontStyles.text30CW,
                  )
                ],
              ),
            ),
            // lies
            Expanded(
              child: ListView(
                children: List.generate(
                  (data.userPlaylistModelType!.playlist == null)
                      ? 0
                      : data.userPlaylistModelType.playlist!.length,
                  (index) {
                    var listInfo = data.userPlaylistModelType.playlist![index];
                    return ListTile(
                      title: Text(
                        listInfo.name!,
                        style: KazeFontStyles.text20CW,
                      ),
                      subtitle: Text(
                        listInfo.creator!.nickname!,
                        style: KazeFontStyles.text16C,
                      ),
                      leading: Image.network(listInfo.coverImgUrl!),
                      trailing: Text("共${listInfo.playCount}首歌曲"),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
