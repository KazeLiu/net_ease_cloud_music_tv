import 'package:net_ease_cloud_music_tv/model/login/qr_check_model.dart';
import 'package:net_ease_cloud_music_tv/model/login/qr_key_model.dart';
import 'package:net_ease_cloud_music_tv/model/login/qr_create_model.dart';

import '../model/login/login_status.dart';
import 'main.dart';

class QRLogin {
  static getQRKey() async {
    const url = "/login/qr/key";
    print("请求登录QRkey");
    ResponseData data = await HttpClass.get(url);
    if (!data.error) {
      return QrKeyModel.fromJson(data.data);
    } else {
      return QrKeyModel();
    }
  }

  static getQR(id) async {
    final url = "/login/qr/create?key=$id&qrimg=true";
    print("请求二维码生成接口");
    ResponseData data = await HttpClass.get(url);
    if (!data.error) {
      return QrCreateModel.fromJson(data.data);
    } else {
      return QrCreateModel();
    }
  }

  static getQRCheck(id) async {
    final url = "/login/qr/check?key=$id";
    print("请求二维码检测扫码状态接口");
    ResponseData data = await HttpClass.get(url);
    if (!data.error) {
      return QrCheckModel.fromJson(data.data);
    } else {
      return QrCheckModel();
    }
  }

  static getQrStatus() async {
    const url = "/login/status";
    print("请求登录状态");
    ResponseData data = await HttpClass.get(url);
    if (!data.error) {
      return LoginStatus.fromJson(data.data);
    } else {
      return LoginStatus();
    }
  }

}
