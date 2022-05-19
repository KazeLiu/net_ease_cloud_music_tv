import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/main.dart';
import 'package:net_ease_cloud_music_tv/page/home/home_user_card.dart';
import 'package:net_ease_cloud_music_tv/page/login/main.dart';
import 'package:net_ease_cloud_music_tv/provider/user_provider.dart';
import 'package:net_ease_cloud_music_tv/request/user_info_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:provider/provider.dart';

import '../../model/user/user_account_model.dart';
import '../../request/main.dart';
import '../../tool/eventbus.dart';
import '../../tool/persistence.dart';
import '../playlist/main.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.isLogin}) : super(key: key);
  static String routerName = "/home";

  //  是否为登录页面过来
  bool isLogin;

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
    _checkLogin();
  }

  _checkLogin() async {
    String cookie = await KazePreferences().getString(key: 'cookie');
    // cookie = "MUSIC_U=3ab933dcff35b4a6f2277c3707c555a9774db36023216ddcf8d549e91c67321a86aa81495fbc8e0798498cfd24b6a43e4eb7237e7443f189404df88cdb2565ce5565b1db6a7a91fcf1404421f8df0374b29021d9876d02e3ab44b147539222e23058a731ea016156";
    cookie =
        "MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/eapi/clientlog; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/neapi/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/weapi/feedback; HTTPOnly;MUSIC_A_T=1405209329000; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/api/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/eapi/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/wapi/clientlog; HTTPOnly;MUSIC_A_T=1405209329000; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/wapi/feedback; HTTPOnly;MUSIC_U=5fbd7494390cdd693471401fda14c732e84f758a4d692e215c9ebd55f37d9b95993166e004087dd30ef37ab071ac646641e3ee32833518c657655c97021ab67dcb78fc60efaf376c1b93ac14e0ed86ab; Max-Age=15552000; Expires=Sat, 12 Nov 2022 03:31:26";
    if (cookie.isNotEmpty) {
      // 因为登录界面已经跑了一次就不需要再次跑了
      if (!widget.isLogin) {
        HttpClass.init();
        print('init');
        kazeEventBus.fire(ChangeCookie(cookie));
        print('kazeEventBusInit');
      }
      _getUserDetail();
    } else {
      print("没获取到cookie");
      Navigator.pushNamed(context, LoginByQR.routerName);
    }
  }

  _getUserDetail() async {
    UserAccountModel data = await UserInfoRequest.getUserDetail();
    if (data.account != null) {
      print(data.account!.id!);
      Provider.of<UserProvider>(context, listen: false).userAccountModel = data;
    } else {
      print("没获取到在线信息");
      await KazePreferences().saveString(key: 'cookie', value: "");
      Navigator.pushNamed(context, LoginByQR.routerName);
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _iconAndTitle(0xe61c, "我创建的歌单", 1),
                      _iconAndTitle(0xe62f, "我收藏的歌单", 2),
                      _iconAndTitle(0xe8a6, "官方歌单", 0)
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
