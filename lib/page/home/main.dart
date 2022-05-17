import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/page/home/home_user_card.dart';
import 'package:net_ease_cloud_music_tv/provider/user_provider.dart';
import 'package:net_ease_cloud_music_tv/request/user_info_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';

import '../../model/user/user_account_model.dart';
import '../playlist/main.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static String routerName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    UserAccountModel data = await UserInfoRequest.getUserDetail();
    if (data.account != null) {
      print(data.account!.id!);
      Provider.of<UserProvider>(context, listen: false).userAccountModel = data;
    } else {
      print("没获取到");
      // await KazePreferences().saveString(key: 'cookie', value: "");
      // Navigator.pushNamed(context, LoginByQR.routerName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<UserProvider>(
        builder: (ctx, data, _) {
          if (data.userAccountModel.account == null) {
            return const Text("loading");
          } else {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // 登录信息
                  UserDetail(data),
                  // 歌单信息
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconAndTitle(0xe637, "心动模式", 0),
                      _iconAndTitle(0xe61c, "我创建的歌单", 1),
                      _iconAndTitle(0xe62f, "我收藏的歌单", 2),
                      // _iconAndTitle(0xe8a6, "更多",0)
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  _iconAndTitle(iconName, title, type) {
    return SizedBox(
      height: 300,
      width: 300,
      child: GestureDetector(
        onTap: () {
          if (type == 1 || type == 2) {
            // Navigator.of(context)
            //     .pushNamed(PlayList.routerName, arguments: {type: type});

            Navigator.of(context)
                .pushNamed(PlayList.routerName, arguments: type);
          }
        },
        child: Card(
          color: const Color(0xFF2B2B2B),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(130),
                child: Icon(
                  IconData(iconName, fontFamily: 'iconfont'),
                  size: 100,
                  color: KazeColors.FontColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: KazeFontStyles.text30C,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
