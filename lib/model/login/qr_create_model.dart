import 'dart:convert';
/// code : 200
/// data : {"qrurl":"https://music.163.com/login?codekey=711ce790-04bf-4b3b-bb68-1dbdcd5109a0","qrimg":""}

QrCreateModel qrCreateModelFromJson(String str) => QrCreateModel.fromJson(json.decode(str));
String qrCreateModelToJson(QrCreateModel data) => json.encode(data.toJson());
class QrCreateModel {
  QrCreateModel({
      this.code, 
      this.data,});

  QrCreateModel.fromJson(dynamic json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// qrurl : "https://music.163.com/login?codekey=711ce790-04bf-4b3b-bb68-1dbdcd5109a0"
/// qrimg : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.qrurl, 
      this.qrimg,});

  Data.fromJson(dynamic json) {
    qrurl = json['qrurl'];
    qrimg = json['qrimg'];
  }
  String? qrurl;
  String? qrimg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['qrurl'] = qrurl;
    map['qrimg'] = qrimg;
    return map;
  }

}