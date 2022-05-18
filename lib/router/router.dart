import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/page/home/main.dart';
import 'package:net_ease_cloud_music_tv/page/login/main.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/main.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/play_controller.dart';
import 'package:net_ease_cloud_music_tv/page/playlist/play_interface.dart';

import '../page/playlist/list_detail.dart';

class KazeRouter {
  static final Map<String, WidgetBuilder> routes = {
    "/": (context) => LoginByQR(),
    LoginByQR.routerName: (ctx) => LoginByQR(),
    Home.routerName: (ctx) => Home(),
    PlayList.routerName: (context, {arguments}) =>
        PlayList(listType: arguments),
    ListDetail.routerName: (context, {arguments}) =>
        ListDetail(playListId: arguments),
    PlayInterface.routerName: (context, {arguments}) =>
        PlayInterface(songIndex: arguments),
    PlayController.routerName: (context) => const PlayController(),
  };

  static Route routeGenerator(RouteSettings settings) {
    //String? 表示name为可空类型
    final String? name = settings.name;
    //Function? 表示pageContentBuilder为可空类型
    final Function? pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    } else {
      return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
