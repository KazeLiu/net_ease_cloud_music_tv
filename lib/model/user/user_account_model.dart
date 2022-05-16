import 'dart:convert';
/// code : 200
/// account : {"id":30427048,"userName":"1_********266","type":1,"status":0,"whitelistAuthority":0,"createTime":1405209329000,"tokenVersion":0,"ban":0,"baoyueVersion":1,"donateVersion":0,"vipType":11,"anonimousUser":false,"paidFee":false}
/// profile : {"userId":30427048,"userType":0,"nickname":"蓝芷怡","avatarImgId":109951166611666420,"avatarUrl":"http://p2.music.126.net/Jp3HnDdVnr2xRu79o5e8yw==/109951166611666418.jpg","backgroundImgId":109951163028298000,"backgroundUrl":"http://p1.music.126.net/hHtcJ5NrlEVcKq8Ji-NS6g==/109951163028298007.jpg","signature":"我永远喜欢胡桃","createTime":1405211128424,"userName":"1_********266","accountType":1,"shortUserName":"********266","birthday":818611200000,"authority":0,"gender":1,"accountStatus":0,"province":430000,"city":430600,"authStatus":0,"description":null,"detailDescription":null,"defaultAvatar":false,"expertTags":null,"experts":null,"djStatus":0,"locationStatus":30,"vipType":11,"followed":false,"mutual":false,"authenticated":false,"lastLoginTime":1652671886783,"lastLoginIP":"81.68.101.79","remarkName":null,"viptypeVersion":1647392858089,"authenticationTypes":0,"avatarDetail":null,"anchor":false}

UserAccountModel userAccountFromJson(String str) => UserAccountModel.fromJson(json.decode(str));
String userAccountToJson(UserAccountModel data) => json.encode(data.toJson());
class UserAccountModel {
  UserAccountModel({
      this.code, 
      this.account, 
      this.profile,});

  UserAccountModel.fromJson(dynamic json) {
    code = json['code'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  int? code;
  Account? account;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }

}

/// userId : 30427048
/// userType : 0
/// nickname : "蓝芷怡"
/// avatarImgId : 109951166611666420
/// avatarUrl : "http://p2.music.126.net/Jp3HnDdVnr2xRu79o5e8yw==/109951166611666418.jpg"
/// backgroundImgId : 109951163028298000
/// backgroundUrl : "http://p1.music.126.net/hHtcJ5NrlEVcKq8Ji-NS6g==/109951163028298007.jpg"
/// signature : "我永远喜欢胡桃"
/// createTime : 1405211128424
/// userName : "1_********266"
/// accountType : 1
/// shortUserName : "********266"
/// birthday : 818611200000
/// authority : 0
/// gender : 1
/// accountStatus : 0
/// province : 430000
/// city : 430600
/// authStatus : 0
/// description : null
/// detailDescription : null
/// defaultAvatar : false
/// expertTags : null
/// experts : null
/// djStatus : 0
/// locationStatus : 30
/// vipType : 11
/// followed : false
/// mutual : false
/// authenticated : false
/// lastLoginTime : 1652671886783
/// lastLoginIP : "81.68.101.79"
/// remarkName : null
/// viptypeVersion : 1647392858089
/// authenticationTypes : 0
/// avatarDetail : null
/// anchor : false

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());
class Profile {
  Profile({
      this.userId, 
      this.userType, 
      this.nickname, 
      this.avatarImgId, 
      this.avatarUrl, 
      this.backgroundImgId, 
      this.backgroundUrl, 
      this.signature, 
      this.createTime, 
      this.userName, 
      this.accountType, 
      this.shortUserName, 
      this.birthday, 
      this.authority, 
      this.gender, 
      this.accountStatus, 
      this.province, 
      this.city, 
      this.authStatus, 
      this.description, 
      this.detailDescription, 
      this.defaultAvatar, 
      this.expertTags, 
      this.experts, 
      this.djStatus, 
      this.locationStatus, 
      this.vipType, 
      this.followed, 
      this.mutual, 
      this.authenticated, 
      this.lastLoginTime, 
      this.lastLoginIP, 
      this.remarkName, 
      this.viptypeVersion, 
      this.authenticationTypes, 
      this.avatarDetail, 
      this.anchor,});

  Profile.fromJson(dynamic json) {
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    avatarImgId = json['avatarImgId'];
    avatarUrl = json['avatarUrl'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    signature = json['signature'];
    createTime = json['createTime'];
    userName = json['userName'];
    accountType = json['accountType'];
    shortUserName = json['shortUserName'];
    birthday = json['birthday'];
    authority = json['authority'];
    gender = json['gender'];
    accountStatus = json['accountStatus'];
    province = json['province'];
    city = json['city'];
    authStatus = json['authStatus'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    defaultAvatar = json['defaultAvatar'];
    expertTags = json['expertTags'];
    experts = json['experts'];
    djStatus = json['djStatus'];
    locationStatus = json['locationStatus'];
    vipType = json['vipType'];
    followed = json['followed'];
    mutual = json['mutual'];
    authenticated = json['authenticated'];
    lastLoginTime = json['lastLoginTime'];
    lastLoginIP = json['lastLoginIP'];
    remarkName = json['remarkName'];
    viptypeVersion = json['viptypeVersion'];
    authenticationTypes = json['authenticationTypes'];
    avatarDetail = json['avatarDetail'];
    anchor = json['anchor'];
  }
  int? userId;
  int? userType;
  String? nickname;
  int? avatarImgId;
  String? avatarUrl;
  int? backgroundImgId;
  String? backgroundUrl;
  String? signature;
  int? createTime;
  String? userName;
  int? accountType;
  String? shortUserName;
  int? birthday;
  int? authority;
  int? gender;
  int? accountStatus;
  int? province;
  int? city;
  int? authStatus;
  dynamic description;
  dynamic detailDescription;
  bool? defaultAvatar;
  dynamic expertTags;
  dynamic experts;
  int? djStatus;
  int? locationStatus;
  int? vipType;
  bool? followed;
  bool? mutual;
  bool? authenticated;
  int? lastLoginTime;
  String? lastLoginIP;
  dynamic remarkName;
  int? viptypeVersion;
  int? authenticationTypes;
  dynamic avatarDetail;
  bool? anchor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['userType'] = userType;
    map['nickname'] = nickname;
    map['avatarImgId'] = avatarImgId;
    map['avatarUrl'] = avatarUrl;
    map['backgroundImgId'] = backgroundImgId;
    map['backgroundUrl'] = backgroundUrl;
    map['signature'] = signature;
    map['createTime'] = createTime;
    map['userName'] = userName;
    map['accountType'] = accountType;
    map['shortUserName'] = shortUserName;
    map['birthday'] = birthday;
    map['authority'] = authority;
    map['gender'] = gender;
    map['accountStatus'] = accountStatus;
    map['province'] = province;
    map['city'] = city;
    map['authStatus'] = authStatus;
    map['description'] = description;
    map['detailDescription'] = detailDescription;
    map['defaultAvatar'] = defaultAvatar;
    map['expertTags'] = expertTags;
    map['experts'] = experts;
    map['djStatus'] = djStatus;
    map['locationStatus'] = locationStatus;
    map['vipType'] = vipType;
    map['followed'] = followed;
    map['mutual'] = mutual;
    map['authenticated'] = authenticated;
    map['lastLoginTime'] = lastLoginTime;
    map['lastLoginIP'] = lastLoginIP;
    map['remarkName'] = remarkName;
    map['viptypeVersion'] = viptypeVersion;
    map['authenticationTypes'] = authenticationTypes;
    map['avatarDetail'] = avatarDetail;
    map['anchor'] = anchor;
    return map;
  }

}

/// id : 30427048
/// userName : "1_********266"
/// type : 1
/// status : 0
/// whitelistAuthority : 0
/// createTime : 1405209329000
/// tokenVersion : 0
/// ban : 0
/// baoyueVersion : 1
/// donateVersion : 0
/// vipType : 11
/// anonimousUser : false
/// paidFee : false

Account accountFromJson(String str) => Account.fromJson(json.decode(str));
String accountToJson(Account data) => json.encode(data.toJson());
class Account {
  Account({
      this.id, 
      this.userName, 
      this.type, 
      this.status, 
      this.whitelistAuthority, 
      this.createTime, 
      this.tokenVersion, 
      this.ban, 
      this.baoyueVersion, 
      this.donateVersion, 
      this.vipType, 
      this.anonimousUser, 
      this.paidFee,});

  Account.fromJson(dynamic json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    anonimousUser = json['anonimousUser'];
    paidFee = json['paidFee'];
  }
  int? id;
  String? userName;
  int? type;
  int? status;
  int? whitelistAuthority;
  int? createTime;
  int? tokenVersion;
  int? ban;
  int? baoyueVersion;
  int? donateVersion;
  int? vipType;
  bool? anonimousUser;
  bool? paidFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userName'] = userName;
    map['type'] = type;
    map['status'] = status;
    map['whitelistAuthority'] = whitelistAuthority;
    map['createTime'] = createTime;
    map['tokenVersion'] = tokenVersion;
    map['ban'] = ban;
    map['baoyueVersion'] = baoyueVersion;
    map['donateVersion'] = donateVersion;
    map['vipType'] = vipType;
    map['anonimousUser'] = anonimousUser;
    map['paidFee'] = paidFee;
    return map;
  }

}