import 'dart:async';
import 'dart:convert' as convert;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:net_ease_cloud_music_tv/model/login/login_status.dart';
import 'package:net_ease_cloud_music_tv/model/login/qr_check_model.dart';
import 'package:net_ease_cloud_music_tv/model/login/qr_create_model.dart';
import 'package:net_ease_cloud_music_tv/model/login/qr_key_model.dart';
import 'package:net_ease_cloud_music_tv/page/home/main.dart';
import 'package:net_ease_cloud_music_tv/request/login_request.dart';
import 'package:net_ease_cloud_music_tv/tool/color.dart';
import 'package:net_ease_cloud_music_tv/tool/eventbus.dart';
import 'package:net_ease_cloud_music_tv/tool/persistence.dart';

import '../../request/main.dart';

class LoginByQR extends StatefulWidget {
  LoginByQR({Key? key}) : super(key: key);
  static String routerName = '/loginByQR';

  @override
  State<LoginByQR> createState() => _LoginByQRState();
}

class _LoginByQRState extends State<LoginByQR> {
  @override
  void initState() {
    _getQrKey();
    super.initState();
  }

  String id = "";
  String infoText = "扫码后请耐心等待一分钟左右";
  Uint8List? decodeTxt;

  // _checkLogin() async {
  //   String cookie = await KazePreferences().getString(key: 'cookie');
  //   if (cookie.isEmpty) {
  //
  //   } else {
  //     HttpClass();
  //     kazeEventBus.fire(ChangeCookie(cookie));
  //     Navigator.pushNamed(context, Home.routerName);
  //   }
  // }

  _getQrStatus(cookie) async {
    LoginStatus loginStatus = await QRLogin.getQrStatus();
    if (loginStatus.data?.account == null) {
      _getQrKey();
    } else {
      Navigator.pushNamed(context, Home.routerName);
    }
  }

  _getQrKey() async {
    QrKeyModel qrKeyModel = await QRLogin.getQRKey();
    id = qrKeyModel.data!.unikey!;
    _getQr();
  }

  _getQr() async {
    QrCreateModel qrCreateModel = await QRLogin.getQR(id);
    setState(() {
      if (qrCreateModel.data!.qrimg != null) {
        decodeTxt =
            convert.base64.decode(qrCreateModel.data!.qrimg!.split(',')[1]);
      }
    });
    Timer.periodic(const Duration(milliseconds: 3000), (timer) async {
      QrCheckModel qrCreateModel = await _getQrCheck();
      // 801 等待扫码  803 登录成功 ??? 超时
      if (qrCreateModel.code == 803) {
        timer.cancel();
        // 存cookies
        HttpClass.init();
        kazeEventBus.fire(ChangeCookie(qrCreateModel.cookie!));
        KazePreferences()
            .saveString(key: "cookie", value: qrCreateModel.cookie);
        // todo 以后换成pop试试
        Navigator.pushNamed(context, Home.routerName, arguments: true);
      } else if (qrCreateModel.code == 801) {
        setState(() {
          infoText = '扫码后请耐心等待一分钟左右，于${DateTime.now()}获取了一次状态，请继续等待';
        });
      } else if (qrCreateModel.code == 802) {
        timer.cancel();
      }
    });
  }

  _getQrCheck() async {
    return await QRLogin.getQRCheck(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          decodeTxt == null
              ? const Text(
                  "获取中，请稍后",
                  style: KazeFontStyles.text30C,
                )
              : Image.memory(
                  decodeTxt!,
                  width: 400,
                  fit: BoxFit.fitWidth,
                  gaplessPlayback: true, //防止重绘
                ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "ID:$id",
            style: KazeFontStyles.text20C,
          ),
          Text(
            infoText,
            style: KazeFontStyles.text20C,
          ),
          const Text(
            "请使用手机扫描二维码",
            style: KazeFontStyles.text20C,
          ),
        ],
      ),
    );
  }
}
