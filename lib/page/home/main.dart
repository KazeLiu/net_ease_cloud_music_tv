import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/page/login/main.dart';
import 'package:net_ease_cloud_music_tv/provider/user_provider.dart';
import 'package:net_ease_cloud_music_tv/request/user_info_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:net_ease_cloud_music_tv/tool/persistence.dart';
import 'package:provider/provider.dart';

import '../../model/user/user_account_model.dart';

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
                  Card(
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(130),
                                child: Image.network(
                                  data.userAccountModel.profile!.avatarUrl!,
                                  width: 130,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    data.userAccountModel.profile!.nickname!,
                                    style: KazeFontStyles.text30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    data.userAccountModel.profile!.userId
                                        .toString(),
                                    style: KazeFontStyles.text20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: 600,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      data.userAccountModel.profile!
                                          .backgroundUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                    alignment:Alignment.topCenter
                                    // 完全填充
                                    ),
                              ),
                            ),
                            Container(
                              height: 160,
                              width: 600,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.white.withOpacity(1.0),
                                    Colors.white.withOpacity(0.9),
                                    Colors.white.withOpacity(0.8),
                                    Colors.white.withOpacity(0.2),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.white.withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                ),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // 歌单信息
                  Row(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  _imageAndTitle(imageUrl, title) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(130),
            child: Image.network(
              imageUrl,
              width: 130,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: KazeFontStyles.text20CW,
          ),
        ],
      ),
    );
  }
}
