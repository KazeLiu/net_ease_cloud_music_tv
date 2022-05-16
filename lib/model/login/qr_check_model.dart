import 'dart:convert';
/// code : 800
/// message : "二维码不存在或已过期"
/// cookie : ""

QrCheckModel qrCheckModelFromJson(String str) => QrCheckModel.fromJson(json.decode(str));
String qrCheckModelToJson(QrCheckModel data) => json.encode(data.toJson());
class QrCheckModel {
  QrCheckModel({
      this.code, 
      this.message, 
      this.cookie,});

  QrCheckModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    cookie = json['cookie'];
  }
  int? code;
  String? message;
  String? cookie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['cookie'] = cookie;
    return map;
  }

}