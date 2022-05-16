import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/page/home/main.dart';

import 'package:net_ease_cloud_music_tv/page/login/main.dart';

class KazeRouter {
  static final Map<String, WidgetBuilder> routes = {
    "/": (context) => LoginByQR(),
    LoginByQR.routerName: (ctx) => LoginByQR(),
    Home.routerName: (ctx) => Home(),
  };

  /// 添加页面后记得在上面加上 不然就会直接跳转到404
  static Route routeGenerator(RouteSettings settings) {
    final String? name = settings.name;
    final Function? pageBuilder = routes[name];
    if (pageBuilder != null) {
      if (settings.arguments != null) {
        // 如果传了参数
        return MaterialPageRoute(
            builder: (context) =>
                pageBuilder(context, arguments: settings.arguments));
      } else {
        // 没有传参数
        return MaterialPageRoute(builder: (context) => pageBuilder(context));
      }
    }
    return MaterialPageRoute(builder: (context) => pageBuilder!(context));
    // return MaterialPageRoute(builder: (context) => DunError(error: "404"));
  }
}
