class MapInfoModel {
  String? cafename;
  List<int>? categories;
  String? address;
  String? time;
  String? phone;
  double? latitude;
  double? longitude;
  double? avgscore;
  bool? heart;
  int? reviewcount;
  List<RecentReviews>? recentReviews;

  MapInfoModel(
      {this.cafename,
        this.categories,
        this.address,
        this.time,
        this.phone,
        this.latitude,
        this.longitude,
        this.avgscore,
        this.heart,
        this.reviewcount,
        this.recentReviews});

  MapInfoModel.fromJson(Map<String, dynamic> json) {
    cafename = json['cafename'];
    categories = json['categories'].cast<int>();
    address = json['address'];
    time = json['time'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    avgscore = json['avgscore'];
    heart = json['heart'];
    reviewcount = json['reviewcount'];
    if (json['recentReviews'] != null) {
      recentReviews = <RecentReviews>[];
      json['recentReviews'].forEach((v) {
        recentReviews!.add(new RecentReviews.fromJson(v));
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
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['avgscore'] = this.avgscore;
    data['heart'] = this.heart;
    data['reviewcount'] = this.reviewcount;
    if (this.recentReviews != null) {
      data['recentReviews'] =
          this.recentReviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecentReviews {
  String? picurl;
  String? reviewdate;

  RecentReviews({this.picurl, this.reviewdate});

  RecentReviews.fromJson(Map<String, dynamic> json) {
    picurl = json['picurl'];
    reviewdate = json['reviewdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picurl'] = this.picurl;
    data['reviewdate'] = this.reviewdate;
    return data;
  }
}
