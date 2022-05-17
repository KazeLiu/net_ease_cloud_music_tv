import 'dart:convert';
/// data : [{"id":33894312,"url":"http://m8.music.126.net/20220517180729/cf1ff41806d8e7ab3cee70b65e0617ee/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3","br":320000,"size":10691439,"md5":"a8772889f38dfcb91c04da915b301617","code":200,"expi":1200,"type":"mp3","gain":-6.3075,"fee":0,"uf":null,"payed":0,"flag":1,"canExtend":false,"freeTrialInfo":null,"level":"exhigh","encodeType":"mp3","freeTrialPrivilege":{"resConsumable":false,"userConsumable":false,"listenType":null},"freeTimeTrialPrivilege":{"resConsumable":false,"userConsumable":false,"type":0,"remainTime":0},"urlSource":0}]
/// code : 200

PlayListenModel playModelFromJson(String str) => PlayListenModel.fromJson(json.decode(str));
String playModelToJson(PlayListenModel data) => json.encode(data.toJson());
class PlayListenModel {
  PlayListenModel({
      this.data, 
      this.code,});

  PlayListenModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    code = json['code'];
  }
  List<Data>? data;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    return map;
  }

}

/// id : 33894312
/// url : "http://m8.music.126.net/20220517180729/cf1ff41806d8e7ab3cee70b65e0617ee/ymusic/0fd6/4f65/43ed/a8772889f38dfcb91c04da915b301617.mp3"
/// br : 320000
/// size : 10691439
/// md5 : "a8772889f38dfcb91c04da915b301617"
/// code : 200
/// expi : 1200
/// type : "mp3"
/// gain : -6.3075
/// fee : 0
/// uf : null
/// payed : 0
/// flag : 1
/// canExtend : false
/// freeTrialInfo : null
/// level : "exhigh"
/// encodeType : "mp3"
/// freeTrialPrivilege : {"resConsumable":false,"userConsumable":false,"listenType":null}
/// freeTimeTrialPrivilege : {"resConsumable":false,"userConsumable":false,"type":0,"remainTime":0}
/// urlSource : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.url, 
      this.br, 
      this.size, 
      this.md5, 
      this.code, 
      this.expi, 
      this.type, 
      this.gain, 
      this.fee, 
      this.uf, 
      this.payed, 
      this.flag, 
      this.canExtend, 
      this.freeTrialInfo, 
      this.level, 
      this.encodeType, 
      this.freeTrialPrivilege, 
      this.freeTimeTrialPrivilege, 
      this.urlSource,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    br = json['br'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    type = json['type'];
    gain = json['gain'];
    fee = json['fee'];
    uf = json['uf'];
    payed = json['payed'];
    flag = json['flag'];
    canExtend = json['canExtend'];
    freeTrialInfo = json['freeTrialInfo'];
    level = json['level'];
    encodeType = json['encodeType'];
    freeTrialPrivilege = json['freeTrialPrivilege'] != null ? FreeTrialPrivilege.fromJson(json['freeTrialPrivilege']) : null;
    freeTimeTrialPrivilege = json['freeTimeTrialPrivilege'] != null ? FreeTimeTrialPrivilege.fromJson(json['freeTimeTrialPrivilege']) : null;
    urlSource = json['urlSource'];
  }
  int? id;
  String? url;
  int? br;
  int? size;
  String? md5;
  int? code;
  int? expi;
  String? type;
  double? gain;
  int? fee;
  dynamic uf;
  int? payed;
  int? flag;
  bool? canExtend;
  dynamic freeTrialInfo;
  String? level;
  String? encodeType;
  FreeTrialPrivilege? freeTrialPrivilege;
  FreeTimeTrialPrivilege? freeTimeTrialPrivilege;
  int? urlSource;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['br'] = br;
    map['size'] = size;
    map['md5'] = md5;
    map['code'] = code;
    map['expi'] = expi;
    map['type'] = type;
    map['gain'] = gain;
    map['fee'] = fee;
    map['uf'] = uf;
    map['payed'] = payed;
    map['flag'] = flag;
    map['canExtend'] = canExtend;
    map['freeTrialInfo'] = freeTrialInfo;
    map['level'] = level;
    map['encodeType'] = encodeType;
    if (freeTrialPrivilege != null) {
      map['freeTrialPrivilege'] = freeTrialPrivilege?.toJson();
    }
    if (freeTimeTrialPrivilege != null) {
      map['freeTimeTrialPrivilege'] = freeTimeTrialPrivilege?.toJson();
    }
    map['urlSource'] = urlSource;
    return map;
  }

}

/// resConsumable : false
/// userConsumable : false
/// type : 0
/// remainTime : 0

FreeTimeTrialPrivilege freeTimeTrialPrivilegeFromJson(String str) => FreeTimeTrialPrivilege.fromJson(json.decode(str));
String freeTimeTrialPrivilegeToJson(FreeTimeTrialPrivilege data) => json.encode(data.toJson());
class FreeTimeTrialPrivilege {
  FreeTimeTrialPrivilege({
      this.resConsumable, 
      this.userConsumable, 
      this.type, 
      this.remainTime,});

  FreeTimeTrialPrivilege.fromJson(dynamic json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
    type = json['type'];
    remainTime = json['remainTime'];
  }
  bool? resConsumable;
  bool? userConsumable;
  int? type;
  int? remainTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resConsumable'] = resConsumable;
    map['userConsumable'] = userConsumable;
    map['type'] = type;
    map['remainTime'] = remainTime;
    return map;
  }

}

/// resConsumable : false
/// userConsumable : false
/// listenType : null

FreeTrialPrivilege freeTrialPrivilegeFromJson(String str) => FreeTrialPrivilege.fromJson(json.decode(str));
String freeTrialPrivilegeToJson(FreeTrialPrivilege data) => json.encode(data.toJson());
class FreeTrialPrivilege {
  FreeTrialPrivilege({
      this.resConsumable, 
      this.userConsumable, 
      this.listenType,});

  FreeTrialPrivilege.fromJson(dynamic json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
    listenType = json['listenType'];
  }
  bool? resConsumable;
  bool? userConsumable;
  dynamic listenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resConsumable'] = resConsumable;
    map['userConsumable'] = userConsumable;
    map['listenType'] = listenType;
    return map;
  }

}