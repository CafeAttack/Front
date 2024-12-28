class MapMoreModel {
  String? cafename;
  List<int>? categories;
  String? address;
  String? time;
  String? phone;
  double? avgscore;
  bool? heart;
  List<Reviews>? reviews;
  List<Amenities>? amenities;
  List<Tags>? tags;

  MapMoreModel(
      {this.cafename,
        this.categories,
        this.address,
        this.time,
        this.phone,
        this.avgscore,
        this.heart,
        this.reviews,
        this.amenities,
        this.tags});

  MapMoreModel.fromJson(Map<String, dynamic> json) {
    cafename = json['cafename'];
    categories = json['categories'].cast<int>();
    address = json['address'];
    time = json['time'];
    phone = json['phone'];
    avgscore = json['avgscore'];
    heart = json['heart'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(new Amenities.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafename'] = this.cafename;
    data['categories'] = this.categories;
    data['address'] = this.address;
    data['time'] = this.time;
    data['phone'] = this.phone;
    data['avgscore'] = this.avgscore;
    data['heart'] = this.heart;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.amenities != null) {
      data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? nickname;
  String? reviewdate;
  int? reviewscore;
  String? reviewtext;
  String? picurl;

  Reviews(
      {this.nickname,
        this.reviewdate,
        this.reviewscore,
        this.reviewtext,
        this.picurl});

  Reviews.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    reviewdate = json['reviewdate'];
    reviewscore = json['reviewscore'];
    reviewtext = json['reviewtext'];
    picurl = json['picurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['reviewdate'] = this.reviewdate;
    data['reviewscore'] = this.reviewscore;
    data['reviewtext'] = this.reviewtext;
    data['picurl'] = this.picurl;
    return data;
  }
}

class Amenities {
  String? name;

  Amenities({this.name});

  Amenities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Tags {
  String? tag;
  int? count;

  Tags({this.tag, this.count});

  Tags.fromJson(Map<String, dynamic> json) {
    tag = json['tag'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag'] = this.tag;
    data['count'] = this.count;
    return data;
  }
}
