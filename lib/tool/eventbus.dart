
import 'dart:io';

import 'package:event_bus/event_bus.dart';

EventBus kazeEventBus = EventBus();

class ChangeCookie {
  String cookie;

  ChangeCookie(this.cookie) {
    stringCookieToMap();
  }

  // MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/eapi/clientlog; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/neapi/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/weapi/feedback; HTTPOnly;MUSIC_A_T=1405209329000; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/api/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/eapi/feedback; HTTPOnly;MUSIC_R_T=1405211128424; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/wapi/clientlog; HTTPOnly;MUSIC_A_T=1405209329000; Max-Age=2147483647; Expires=Sat, 03 Jun 2090 06:45:33 GMT; Path=/wapi/feedback; HTTPOnly;MUSIC_U=5fbd7494390cdd693471401fda14c732e84f758a4d692e215c9ebd55f37d9b95993166e004087dd30ef37ab071ac646641e3ee32833518c657655c97021ab67dcb78fc60efaf376c1b93ac14e0ed86ab; Max-Age=15552000; Expires=Sat, 12 Nov 2022 03:31:26
  stringCookieToMap() {
    List<String> list = cookie.split(";");
    Map<String, String> cookieList = {};
    list.forEach((item) {
      var keyValue = item.split('=');
      if (keyValue.length == 2) {
        cookieList[keyValue[0]] = keyValue[1];
      }
    });

    // 暂时只需要这一个 现在只给这个
    return Cookie("MUSIC_U", cookieList['MUSIC_U']!);
  }
}
