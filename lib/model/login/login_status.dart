import 'dart:convert';
/// data : {"code":200,"account":null,"profile":null}

LoginStatus loginStatusFromJson(String str) => LoginStatus.fromJson(json.decode(str));
String loginStatusToJson(LoginStatus data) => json.encode(data.toJson());
class LoginStatus {
  LoginStatus({
      this.data,});

  LoginStatus.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// code : 200
/// account : null
/// profile : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.code, 
      this.account, 
      this.profile,});

  Data.fromJson(dynamic json) {
    code = json['code'];
    account = json['account'];
    profile = json['profile'];
  }
  int? code;
  dynamic account;
  dynamic profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['account'] = account;
    map['profile'] = profile;
    return map;
  }

}