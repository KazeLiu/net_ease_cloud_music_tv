import 'dart:convert';

/// songs : [{"name":"海阔天空","id":347230,"pst":0,"t":0,"ar":[{"id":11127,"name":"Beyond","tns":[],"alias":[]}],"alia":[],"pop":100,"st":0,"rt":"600902000004240302","fee":1,"v":112,"crbt":null,"cf":"","al":{"id":34209,"name":"海阔天空","picUrl":"https://p2.music.126.net/8y8KJC1eCSO_vUKf2MyZwA==/109951165796899183.jpg","tns":[],"pic_str":"109951165796899183","pic":109951165796899180},"dt":326000,"h":{"br":320001,"fid":0,"size":13042460,"vd":-5649,"sr":44100},"m":{"br":192001,"fid":0,"size":7825493,"vd":-3083,"sr":44100},"l":{"br":128001,"fid":0,"size":5217010,"vd":-1486,"sr":44100},"sq":{"br":798710,"fid":0,"size":32547445,"vd":-5601,"sr":44100},"hr":null,"a":null,"cd":"1","no":1,"rtUrl":null,"ftype":0,"rtUrls":[],"djId":0,"copyright":1,"s_id":0,"mark":8192,"originCoverType":1,"originSongSimpleData":null,"tagPicList":null,"resourceState":true,"version":112,"songJumpInfo":null,"entertainmentTags":null,"single":0,"noCopyrightRcmd":null,"mst":9,"cp":7002,"mv":376199,"rtype":0,"rurl":null,"publishTime":746812800000,"tns":["Boundless Oceans, Vast Skies"]},{"name":"Crown of the Loser","id":347231,"pst":0,"t":0,"ar":[{"id":11171,"name":"Beyond Cure","tns":[],"alias":[]}],"alia":[],"pop":10,"st":0,"rt":"","fee":8,"v":17,"crbt":null,"cf":"","al":{"id":34210,"name":"Your Head Smells Good","picUrl":"https://p2.music.126.net/uOAROZ8Ia72yvcmfMIg_Uw==/125344325570003.jpg","tns":["你的头闻起来好香"],"pic":125344325570003},"dt":162120,"h":{"br":320000,"fid":0,"size":6487814,"vd":-28400,"sr":44100},"m":{"br":192000,"fid":0,"size":3892705,"vd":-26199,"sr":44100},"l":{"br":128000,"fid":0,"size":2595151,"vd":-25000,"sr":44100},"sq":{"br":1007034,"fid":0,"size":20407562,"vd":-28500,"sr":44100},"hr":null,"a":null,"cd":"1","no":2,"rtUrl":null,"ftype":0,"rtUrls":[],"djId":0,"copyright":2,"s_id":0,"mark":139264,"originCoverType":0,"originSongSimpleData":null,"tagPicList":null,"resourceState":true,"version":17,"songJumpInfo":null,"entertainmentTags":null,"single":0,"noCopyrightRcmd":null,"mst":9,"cp":1400821,"mv":0,"rtype":0,"rurl":null,"publishTime":1277481600000}]
/// privileges : [{"id":347230,"fee":1,"payed":1,"st":0,"pl":999000,"dl":999000,"sp":7,"cp":1,"subp":1,"cs":false,"maxbr":999000,"fl":0,"toast":false,"flag":260,"preSell":false,"playMaxbr":999000,"downloadMaxbr":999000,"maxBrLevel":"lossless","playMaxBrLevel":"lossless","downloadMaxBrLevel":"lossless","plLevel":"lossless","dlLevel":"lossless","flLevel":"none","rscl":null,"freeTrialPrivilege":{"resConsumable":false,"userConsumable":false,"listenType":null},"chargeInfoList":[{"rate":128000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":192000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":320000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":999000,"chargeUrl":null,"chargeMessage":null,"chargeType":1}]},{"id":347231,"fee":8,"payed":1,"st":0,"pl":999000,"dl":999000,"sp":7,"cp":1,"subp":1,"cs":false,"maxbr":999000,"fl":128000,"toast":false,"flag":4,"preSell":false,"playMaxbr":999000,"downloadMaxbr":999000,"maxBrLevel":"lossless","playMaxBrLevel":"lossless","downloadMaxBrLevel":"lossless","plLevel":"lossless","dlLevel":"lossless","flLevel":"standard","rscl":null,"freeTrialPrivilege":{"resConsumable":false,"userConsumable":false,"listenType":null},"chargeInfoList":[{"rate":128000,"chargeUrl":null,"chargeMessage":null,"chargeType":0},{"rate":192000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":320000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":999000,"chargeUrl":null,"chargeMessage":null,"chargeType":1}]}]
/// code : 200

SongDetailModel songDetailFromJson(String str) =>
    SongDetailModel.fromJson(json.decode(str));

String songDetailToJson(SongDetailModel data) => json.encode(data.toJson());

class SongDetailModel {
  SongDetailModel({
    this.songs,
    this.privileges,
    this.code,});

  SongDetailModel.fromJson(dynamic json) {
    if (json['songs'] != null) {
      songs = [];
      json['songs'].forEach((v) {
        songs?.add(Songs.fromJson(v));
      });
    }
    if (json['privileges'] != null) {
      privileges = [];
      json['privileges'].forEach((v) {
        privileges?.add(Privileges.fromJson(v));
      });
    }
    code = json['code'];
  }

  List<Songs>? songs;
  List<Privileges>? privileges;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (songs != null) {
      map['songs'] = songs?.map((v) => v.toJson()).toList();
    }
    if (privileges != null) {
      map['privileges'] = privileges?.map((v) => v.toJson()).toList();
    }
    map['code'] = code;
    return map;
  }

}

/// id : 347230
/// fee : 1
/// payed : 1
/// st : 0
/// pl : 999000
/// dl : 999000
/// sp : 7
/// cp : 1
/// subp : 1
/// cs : false
/// maxbr : 999000
/// fl : 0
/// toast : false
/// flag : 260
/// preSell : false
/// playMaxbr : 999000
/// downloadMaxbr : 999000
/// maxBrLevel : "lossless"
/// playMaxBrLevel : "lossless"
/// downloadMaxBrLevel : "lossless"
/// plLevel : "lossless"
/// dlLevel : "lossless"
/// flLevel : "none"
/// rscl : null
/// freeTrialPrivilege : {"resConsumable":false,"userConsumable":false,"listenType":null}
/// chargeInfoList : [{"rate":128000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":192000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":320000,"chargeUrl":null,"chargeMessage":null,"chargeType":1},{"rate":999000,"chargeUrl":null,"chargeMessage":null,"chargeType":1}]

Privileges privilegesFromJson(String str) =>
    Privileges.fromJson(json.decode(str));

String privilegesToJson(Privileges data) => json.encode(data.toJson());

class Privileges {
  Privileges({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
    this.playMaxbr,
    this.downloadMaxbr,
    this.maxBrLevel,
    this.playMaxBrLevel,
    this.downloadMaxBrLevel,
    this.plLevel,
    this.dlLevel,
    this.flLevel,
    this.rscl,
    this.freeTrialPrivilege,
    this.chargeInfoList,});

  Privileges.fromJson(dynamic json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
    playMaxbr = json['playMaxbr'];
    downloadMaxbr = json['downloadMaxbr'];
    maxBrLevel = json['maxBrLevel'];
    playMaxBrLevel = json['playMaxBrLevel'];
    downloadMaxBrLevel = json['downloadMaxBrLevel'];
    plLevel = json['plLevel'];
    dlLevel = json['dlLevel'];
    flLevel = json['flLevel'];
    rscl = json['rscl'];
    freeTrialPrivilege =
    json['freeTrialPrivilege'] != null ? FreeTrialPrivilege.fromJson(
        json['freeTrialPrivilege']) : null;
    if (json['chargeInfoList'] != null) {
      chargeInfoList = [];
      json['chargeInfoList'].forEach((v) {
        chargeInfoList?.add(ChargeInfoList.fromJson(v));
      });
    }
  }

  int? id;
  int? fee;
  int? payed;
  int? st;
  int? pl;
  int? dl;
  int? sp;
  int? cp;
  int? subp;
  bool? cs;
  int? maxbr;
  int? fl;
  bool? toast;
  int? flag;
  bool? preSell;
  int? playMaxbr;
  int? downloadMaxbr;
  String? maxBrLevel;
  String? playMaxBrLevel;
  String? downloadMaxBrLevel;
  String? plLevel;
  String? dlLevel;
  String? flLevel;
  dynamic rscl;
  FreeTrialPrivilege? freeTrialPrivilege;
  List<ChargeInfoList>? chargeInfoList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fee'] = fee;
    map['payed'] = payed;
    map['st'] = st;
    map['pl'] = pl;
    map['dl'] = dl;
    map['sp'] = sp;
    map['cp'] = cp;
    map['subp'] = subp;
    map['cs'] = cs;
    map['maxbr'] = maxbr;
    map['fl'] = fl;
    map['toast'] = toast;
    map['flag'] = flag;
    map['preSell'] = preSell;
    map['playMaxbr'] = playMaxbr;
    map['downloadMaxbr'] = downloadMaxbr;
    map['maxBrLevel'] = maxBrLevel;
    map['playMaxBrLevel'] = playMaxBrLevel;
    map['downloadMaxBrLevel'] = downloadMaxBrLevel;
    map['plLevel'] = plLevel;
    map['dlLevel'] = dlLevel;
    map['flLevel'] = flLevel;
    map['rscl'] = rscl;
    if (freeTrialPrivilege != null) {
      map['freeTrialPrivilege'] = freeTrialPrivilege?.toJson();
    }
    if (chargeInfoList != null) {
      map['chargeInfoList'] = chargeInfoList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// rate : 128000
/// chargeUrl : null
/// chargeMessage : null
/// chargeType : 1

ChargeInfoList chargeInfoListFromJson(String str) =>
    ChargeInfoList.fromJson(json.decode(str));

String chargeInfoListToJson(ChargeInfoList data) => json.encode(data.toJson());

class ChargeInfoList {
  ChargeInfoList({
    this.rate,
    this.chargeUrl,
    this.chargeMessage,
    this.chargeType,});

  ChargeInfoList.fromJson(dynamic json) {
    rate = json['rate'];
    chargeUrl = json['chargeUrl'];
    chargeMessage = json['chargeMessage'];
    chargeType = json['chargeType'];
  }

  int? rate;
  dynamic chargeUrl;
  dynamic chargeMessage;
  int? chargeType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['chargeUrl'] = chargeUrl;
    map['chargeMessage'] = chargeMessage;
    map['chargeType'] = chargeType;
    return map;
  }

}

/// resConsumable : false
/// userConsumable : false
/// listenType : null

FreeTrialPrivilege freeTrialPrivilegeFromJson(String str) =>
    FreeTrialPrivilege.fromJson(json.decode(str));

String freeTrialPrivilegeToJson(FreeTrialPrivilege data) =>
    json.encode(data.toJson());

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

/// name : "海阔天空"
/// id : 347230
/// pst : 0
/// t : 0
/// ar : [{"id":11127,"name":"Beyond","tns":[],"alias":[]}]
/// alia : []
/// pop : 100
/// st : 0
/// rt : "600902000004240302"
/// fee : 1
/// v : 112
/// crbt : null
/// cf : ""
/// al : {"id":34209,"name":"海阔天空","picUrl":"https://p2.music.126.net/8y8KJC1eCSO_vUKf2MyZwA==/109951165796899183.jpg","tns":[],"pic_str":"109951165796899183","pic":109951165796899180}
/// dt : 326000
/// h : {"br":320001,"fid":0,"size":13042460,"vd":-5649,"sr":44100}
/// m : {"br":192001,"fid":0,"size":7825493,"vd":-3083,"sr":44100}
/// l : {"br":128001,"fid":0,"size":5217010,"vd":-1486,"sr":44100}
/// sq : {"br":798710,"fid":0,"size":32547445,"vd":-5601,"sr":44100}
/// hr : null
/// a : null
/// cd : "1"
/// no : 1
/// rtUrl : null
/// ftype : 0
/// rtUrls : []
/// djId : 0
/// copyright : 1
/// s_id : 0
/// mark : 8192
/// originCoverType : 1
/// originSongSimpleData : null
/// tagPicList : null
/// resourceState : true
/// version : 112
/// songJumpInfo : null
/// entertainmentTags : null
/// single : 0
/// noCopyrightRcmd : null
/// mst : 9
/// cp : 7002
/// mv : 376199
/// rtype : 0
/// rurl : null
/// publishTime : 746812800000
/// tns : ["Boundless Oceans, Vast Skies"]

Songs songsFromJson(String str) => Songs.fromJson(json.decode(str));

String songsToJson(Songs data) => json.encode(data.toJson());

class Songs {
  Songs({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.sq,
    this.hr,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.sId,
    this.mark,
    this.originCoverType,
    this.originSongSimpleData,
    this.tagPicList,
    this.resourceState,
    this.version,
    this.songJumpInfo,
    this.entertainmentTags,
    this.single,
    this.noCopyrightRcmd,
    this.mst,
    this.cp,
    this.mv,
    this.rtype,
    this.rurl,
    this.publishTime,
    this.tns,});

  Songs.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    pst = json['pst'];
    t = json['t'];
    if (json['ar'] != null) {
      ar = [];
      json['ar'].forEach((v) {
        ar?.add(Ar.fromJson(v));
      });
    }
    if (json['alia'] != null) {
      alia = [];
      json['alia'].forEach((v) {
        alia?.add(v);
      });
    }
    pop = json['pop'];
    st = json['st'];
    rt = json['rt'];
    fee = json['fee'];
    v = json['v'];
    crbt = json['crbt'];
    cf = json['cf'];
    al = json['al'] != null ? Al.fromJson(json['al']) : null;
    dt = json['dt'];
    h = json['h'] != null ? H.fromJson(json['h']) : null;
    m = json['m'] != null ? M.fromJson(json['m']) : null;
    l = json['l'] != null ? L.fromJson(json['l']) : null;
    sq = json['sq'] != null ? Sq.fromJson(json['sq']) : null;
    hr = json['hr'];
    a = json['a'];
    cd = json['cd'];
    no = json['no'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    if (json['rtUrls'] != null) {
      rtUrls = [];
      json['rtUrls'].forEach((v) {
        rtUrls?.add(v);
      });
    }
    djId = json['djId'];
    copyright = json['copyright'];
    sId = json['s_id'];
    mark = json['mark'];
    originCoverType = json['originCoverType'];
    originSongSimpleData = json['originSongSimpleData'];
    tagPicList = json['tagPicList'];
    resourceState = json['resourceState'];
    version = json['version'];
    songJumpInfo = json['songJumpInfo'];
    entertainmentTags = json['entertainmentTags'];
    single = json['single'];
    noCopyrightRcmd = json['noCopyrightRcmd'];
    mst = json['mst'];
    cp = json['cp'];
    mv = json['mv'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    publishTime = json['publishTime'];
    tns = json['tns'] != null ? json['tns'].cast<String>() : [];
  }

  String? name;
  int? id;
  int? pst;
  int? t;
  List<Ar>? ar;
  List<dynamic>? alia;
  int? pop;
  int? st;
  String? rt;
  int? fee;
  int? v;
  dynamic crbt;
  String? cf;
  Al? al;
  int? dt;
  H? h;
  M? m;
  L? l;
  Sq? sq;
  dynamic hr;
  dynamic a;
  String? cd;
  int? no;
  dynamic rtUrl;
  int? ftype;
  List<dynamic>? rtUrls;
  int? djId;
  int? copyright;
  int? sId;
  int? mark;
  int? originCoverType;
  dynamic originSongSimpleData;
  dynamic tagPicList;
  bool? resourceState;
  int? version;
  dynamic songJumpInfo;
  dynamic entertainmentTags;
  int? single;
  dynamic noCopyrightRcmd;
  int? mst;
  int? cp;
  int? mv;
  int? rtype;
  dynamic rurl;
  int? publishTime;
  List<String>? tns;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['pst'] = pst;
    map['t'] = t;
    if (ar != null) {
      map['ar'] = ar?.map((v) => v.toJson()).toList();
    }
    if (alia != null) {
      map['alia'] = alia?.map((v) => v.toJson()).toList();
    }
    map['pop'] = pop;
    map['st'] = st;
    map['rt'] = rt;
    map['fee'] = fee;
    map['v'] = v;
    map['crbt'] = crbt;
    map['cf'] = cf;
    if (al != null) {
      map['al'] = al?.toJson();
    }
    map['dt'] = dt;
    if (h != null) {
      map['h'] = h?.toJson();
    }
    if (m != null) {
      map['m'] = m?.toJson();
    }
    if (l != null) {
      map['l'] = l?.toJson();
    }
    if (sq != null) {
      map['sq'] = sq?.toJson();
    }
    map['hr'] = hr;
    map['a'] = a;
    map['cd'] = cd;
    map['no'] = no;
    map['rtUrl'] = rtUrl;
    map['ftype'] = ftype;
    if (rtUrls != null) {
      map['rtUrls'] = rtUrls?.map((v) => v.toJson()).toList();
    }
    map['djId'] = djId;
    map['copyright'] = copyright;
    map['s_id'] = sId;
    map['mark'] = mark;
    map['originCoverType'] = originCoverType;
    map['originSongSimpleData'] = originSongSimpleData;
    map['tagPicList'] = tagPicList;
    map['resourceState'] = resourceState;
    map['version'] = version;
    map['songJumpInfo'] = songJumpInfo;
    map['entertainmentTags'] = entertainmentTags;
    map['single'] = single;
    map['noCopyrightRcmd'] = noCopyrightRcmd;
    map['mst'] = mst;
    map['cp'] = cp;
    map['mv'] = mv;
    map['rtype'] = rtype;
    map['rurl'] = rurl;
    map['publishTime'] = publishTime;
    map['tns'] = tns;
    return map;
  }

}

/// br : 798710
/// fid : 0
/// size : 32547445
/// vd : -5601
/// sr : 44100

Sq sqFromJson(String str) => Sq.fromJson(json.decode(str));

String sqToJson(Sq data) => json.encode(data.toJson());

class Sq {
  Sq({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,});

  Sq.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }

  int? br;
  int? fid;
  int? size;
  num? vd;
  int? sr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

/// br : 128001
/// fid : 0
/// size : 5217010
/// vd : -1486
/// sr : 44100

L lFromJson(String str) => L.fromJson(json.decode(str));

String lToJson(L data) => json.encode(data.toJson());

class L {
  L({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,});

  L.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }

  int? br;
  int? fid;
  int? size;
  num? vd;
  int? sr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

/// br : 192001
/// fid : 0
/// size : 7825493
/// vd : -3083
/// sr : 44100

M mFromJson(String str) => M.fromJson(json.decode(str));

String mToJson(M data) => json.encode(data.toJson());

class M {
  M({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,});

  M.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }

  int? br;
  int? fid;
  int? size;
  num? vd;
  int? sr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

/// br : 320001
/// fid : 0
/// size : 13042460
/// vd : -5649
/// sr : 44100

H hFromJson(String str) => H.fromJson(json.decode(str));

String hToJson(H data) => json.encode(data.toJson());

class H {
  H({
    this.br,
    this.fid,
    this.size,
    this.vd,
    this.sr,});

  H.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }

  int? br;
  int? fid;
  int? size;
  num? vd;
  int? sr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

/// id : 34209
/// name : "海阔天空"
/// picUrl : "https://p2.music.126.net/8y8KJC1eCSO_vUKf2MyZwA==/109951165796899183.jpg"
/// tns : []
/// pic_str : "109951165796899183"
/// pic : 109951165796899180

Al alFromJson(String str) => Al.fromJson(json.decode(str));

String alToJson(Al data) => json.encode(data.toJson());

class Al {
  Al({
    this.id,
    this.name,
    this.picUrl,
    this.tns,
    this.picStr,
    this.pic,});

  Al.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picUrl = json['picUrl'];
    if (json['tns'] != null) {
      tns = [];
      json['tns'].forEach((v) {
        tns?.add(v);
      });
    }
    picStr = json['pic_str'];
    pic = json['pic'];
  }

  int? id;
  String? name;
  String? picUrl;
  List<dynamic>? tns;
  String? picStr;
  int? pic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['picUrl'] = picUrl;
    if (tns != null) {
      map['tns'] = tns?.map((v) => v.toJson()).toList();
    }
    map['pic_str'] = picStr;
    map['pic'] = pic;
    return map;
  }

}

/// id : 11127
/// name : "Beyond"
/// tns : []
/// alias : []

Ar arFromJson(String str) => Ar.fromJson(json.decode(str));

String arToJson(Ar data) => json.encode(data.toJson());

class Ar {
  Ar({
    this.id,
    this.name,
    this.tns,
    this.alias,});

  Ar.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['tns'] != null) {
      tns = [];
      json['tns'].forEach((v) {
        tns?.add(v);
      });
    }
    if (json['alias'] != null) {
      alias = [];
      json['alias'].forEach((v) {
        alias?.add(v);
      });
    }
  }

  int? id;
  String? name;
  List<dynamic>? tns;
  List<dynamic>? alias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (tns != null) {
      map['tns'] = tns?.map((v) => v.toJson()).toList();
    }
    if (alias != null) {
      map['alias'] = alias?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}