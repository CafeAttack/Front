class MapMoreModel {
  int? status;
  String? message;
  Data? data;

  MapMoreModel({this.status, this.message, this.data});

  MapMoreModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  String? time;
  String? phone;
  List<int>? categoryId;
  int? reviewCnt;
  String? avgScore;
  List<Review>? review;
  int? heart;

  Data(
      {this.cafeName,
        this.address,
        this.time,
        this.phone,
        this.categoryId,
        this.reviewCnt,
        this.avgScore,
        this.review,
        this.heart});

  Data.fromJson(Map<String, dynamic> json) {
    cafeName = json['cafeName'];
    address = json['address'];
    time = json['time'];
    phone = json['phone'];
    categoryId = json['categoryId'].cast<int>();
    reviewCnt = json['reviewCnt'];
    avgScore = json['AvgScore'];
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
    data['address'] = this.address;
    data['time'] = this.time;
    data['phone'] = this.phone;
    data['categoryId'] = this.categoryId;
    data['reviewCnt'] = this.reviewCnt;
    data['AvgScore'] = this.avgScore;
    if (this.review != null) {
      data['review'] = this.review!.map((v) => v.toJson()).toList();
    }
    data['heart'] = this.heart;
    return data;
  }
}

class Review {
  int? reviewId;
  String? reviewWriter;
  String? reviewDate;
  int? reviewScore;
  String? reviewText;
  String? reviewPhoto;
  String? reviewWrtier;

  Review(
      {this.reviewId,
        this.reviewWriter,
        this.reviewDate,
        this.reviewScore,
        this.reviewText,
        this.reviewPhoto,
        this.reviewWrtier});

  Review.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    reviewWriter = json['reviewWriter'];
    reviewDate = json['reviewDate'];
    reviewScore = json['reviewScore'];
    reviewText = json['reviewText'];
    reviewPhoto = json['reviewPhoto'];
    reviewWrtier = json['reviewWrtier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewId'] = this.reviewId;
    data['reviewWriter'] = this.reviewWriter;
    data['reviewDate'] = this.reviewDate;
    data['reviewScore'] = this.reviewScore;
    data['reviewText'] = this.reviewText;
    data['reviewPhoto'] = this.reviewPhoto;
    data['reviewWrtier'] = this.reviewWrtier;
    return data;
  }
}
