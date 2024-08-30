class MapInfoModel {
  int? status;
  String? message;
  Data? data;

  MapInfoModel({this.status, this.message, this.data});

  MapInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? cafeName;
  List<int>? categoryId;
  String? address;
  String? time;
  String? phone;
  int? reviewCnt;
  String? avgScore;
  List<Review>? review;
  bool? heart;

  Data(
      {this.cafeName,
        this.categoryId,
        this.address,
        this.time,
        this.phone,
        this.reviewCnt,
        this.avgScore,
        this.review,
        this.heart});

  Data.fromJson(Map<String, dynamic> json) {
    cafeName = json['cafeName'];
    categoryId = json['categoryId'].cast<int>();
    address = json['address'];
    time = json['time'];
    phone = json['phone'];
    reviewCnt = json['reviewCnt'];
    avgScore = json['avgScore'];
    if (json['review'] != null) {
      review = <Review>[];
      json['review'].forEach((v) {
        review!.add(new Review.fromJson(v));
      });
    }
    heart = json['heart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafeName'] = this.cafeName;
    data['categoryId'] = this.categoryId;
    data['address'] = this.address;
    data['time'] = this.time;
    data['phone'] = this.phone;
    data['avgScore'] = this.avgScore;
    data['reviewCnt'] = this.reviewCnt;
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    data['heart'] = this.heart;
    return data;
  }
}

class Review {
  int? reviewId;
  String? reviewDate;
  String? reviewPhoto;

  Review({this.reviewId, this.reviewDate, this.reviewPhoto});

  Review.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    reviewDate = json['reviewDate'];
    reviewPhoto = json['reviewPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewId'] = this.reviewId;
    data['reviewDate'] = this.reviewDate;
    data['reviewPhoto'] = this.reviewPhoto;
    return data;
  }
}
