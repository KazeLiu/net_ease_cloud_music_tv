import 'dart:convert';
/// data : {"code":200,"unikey":"711ce790-04bf-4b3b-bb68-1dbdcd5109a0"}
/// code : 200

QrKeyModel qrKeyModelFromJson(String str) => QrKeyModel.fromJson(json.decode(str));
String qrKeyModelToJson(QrKeyModel data) => json.encode(data.toJson());
class QrKeyModel {
  QrKeyModel({
      this.data, 
      this.code,});

  QrKeyModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
  }
  Data? data;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['code'] = code;
    return map;
  }

}

/// code : 200
/// unikey : "711ce790-04bf-4b3b-bb68-1dbdcd5109a0"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.code, 
      this.unikey,});

  Data.fromJson(dynamic json) {
    code = json['code'];
    unikey = json['unikey'];
  }
  int? code;
  String? unikey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['unikey'] = unikey;
    return map;
  }

}