class HebcalOutput {
  String? title;
  String? date;
  String? version;
  Location? location;
  Range? range;
  List<Item> items;

  HebcalOutput({
    this.title,
    this.date,
    this.version,
    this.location,
    this.range,
    required this.items,
  });

  factory HebcalOutput.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final date = json['date'];
    final version = json['version'];
    final location =
    json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    final range = json['range'] != null
        ? new Range.fromJson(json['range'])
        : null;

    final items = <Item>[];
    json['items'].forEach((v) {
      items.add(new Item.fromJson(v));
    });

    return HebcalOutput(
        title: title,
        date: date,
        version: version,
        location: location,
        range: range,
        items: items
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['version'] = this.version;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.range != null) {
      data['range'] = this.range!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? title;
  String? city;
  String? tzid;
  double? latitude;
  double? longitude;
  String? cc;
  String? country;
  int? elevation;
  String? admin1;
  String? asciiname;
  String? geo;
  int? geonameid;

  Location({
    this.title,
    this.city,
    this.tzid,
    this.latitude,
    this.longitude,
    this.cc,
    this.country,
    this.elevation,
    this.admin1,
    this.asciiname,
    this.geo,
    this.geonameid,
  });

  Location.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    city = json['city'];
    tzid = json['tzid'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cc = json['cc'];
    country = json['country'];
    elevation = json['elevation'];
    admin1 = json['admin1'];
    asciiname = json['asciiname'];
    geo = json['geo'];
    geonameid = json['geonameid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['city'] = this.city;
    data['tzid'] = this.tzid;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cc'] = this.cc;
    data['country'] = this.country;
    data['elevation'] = this.elevation;
    data['admin1'] = this.admin1;
    data['asciiname'] = this.asciiname;
    data['geo'] = this.geo;
    data['geonameid'] = this.geonameid;
    return data;
  }
}

class Range {
  String? start;
  String? end;

  Range({this.start, this.end});

  Range.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}

class Item {
  String? title;
  String? date;
  String? hdate;
  String? category;
  String? subcat;
  String? titleOrig;
  String? hebrew;
  Leyning? leyning;
  String? link;
  String? memo;
  bool? yomtov;

  Item({
    this.title,
    this.date,
    this.hdate,
    this.category,
    this.subcat,
    this.titleOrig,
    this.hebrew,
    this.leyning,
    this.link,
    this.memo,
    this.yomtov,
  });

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    hdate = json['hdate'];
    category = json['category'];
    subcat = json['subcat'];
    titleOrig = json['title_orig'];
    hebrew = json['hebrew'];
    leyning =
        json['leyning'] != null ? new Leyning.fromJson(json['leyning']) : null;
    link = json['link'];
    memo = json['memo'];
    yomtov = json['yomtov'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['date'] = this.date;
    data['hdate'] = this.hdate;
    data['category'] = this.category;
    data['subcat'] = this.subcat;
    data['title_orig'] = this.titleOrig;
    data['hebrew'] = this.hebrew;
    if (this.leyning != null) {
      data['leyning'] = this.leyning!.toJson();
    }
    data['link'] = this.link;
    data['memo'] = this.memo;
    data['yomtov'] = this.yomtov;
    return data;
  }
}

class Leyning {
  String? torah;
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? haftarah;
  String? maftir;

  Leyning({
    this.torah,
    this.s1,
    this.s2,
    this.s3,
    this.s4,
    this.s5,
    this.s6,
    this.s7,
    this.haftarah,
    this.maftir,
  });

  Leyning.fromJson(Map<String, dynamic> json) {
    torah = json['torah'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    haftarah = json['haftarah'];
    maftir = json['maftir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['torah'] = this.torah;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['haftarah'] = this.haftarah;
    data['maftir'] = this.maftir;
    return data;
  }
}
