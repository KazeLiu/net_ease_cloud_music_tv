import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:net_ease_cloud_music_tv/request/serverBaseUrl.dart';
import 'package:net_ease_cloud_music_tv/tool/eventbus.dart';

class HttpConfig {
  static const serverBaseUrl = kazeServerBaseUrl;
  static const timeout = 5000;
  static Map<String, dynamic> headers = {};
}

class HttpClass {
  static final CookieJar cookieJar = CookieJar();

  static init() {
    kazeEventBus.on<ChangeCookie>().listen((event) {
      List<Cookie> cookies = [event.cookieMap!];
      cookieJar.saveFromResponse(Uri.parse(HttpConfig.serverBaseUrl), cookies);
      print(cookies);
    });
  }

  static List<Map<String, String?>> cookie = [];

  static final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: HttpConfig.timeout,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  static final Dio dio = Dio(_baseOptions);

  static Future _request(
    String url, {
    String method = "get",
    Map<String, dynamic>? params,
    int? type,
  }) async {
    final options = Options(method: method);
    switch (type) {
      case -1:
        dio.options.baseUrl = "";
        break;
      case 0:
        dio.options.baseUrl = HttpConfig.serverBaseUrl;
        break;
    }
    try {
      dio.interceptors.add(_dInter());

      dio.interceptors.add(CookieManager(cookieJar));
      print("请求 ${dio.options.baseUrl}$url");
      Response response = await dio.request(
        url,
        queryParameters: params,
        options: options,
      );
      return ResponseData(false, response.data, "");
    } catch (e) {
      return ResponseData(true, null, e.toString());
    }
  }

  static InterceptorsWrapper _dInter() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError err, handler) async {
        return handler.next(err);
      },
    );
  }

  static Future get(String url, {params, type = 0}) {
    return _request(url, params: params, type: type);
  }

  static Future post(String url, {Map<String, dynamic>? params, type = 0}) {
    return _request(url, method: "post", params: params, type: type);
  }
}

class ResponseData {
  ResponseData(this.error, this.data, this.msg);

  bool error = false;
  dynamic data;
  String msg = "";
}
