class ReviewResponseModel {
  int? status;
  String? message;
  ReviewData? data;

  ReviewResponseModel({this.status, this.message, this.data});

  ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ReviewData.fromJson(json['data']) : null;


  }

}

class ReviewData {
  String? cafename;
  bool? isFavor;

  ReviewData({this.cafename, this.isFavor});

  ReviewData.fromJson(Map<String, dynamic> json) {
    cafename = json['cafename'];
    isFavor = json['favor'];
  }

}

class ReviewWriteRequestModel {
  int? reviewScore;
  String? reviewText;
  List<String>? images;
  List<int>? tags;
  List<bool>? amenities;

  ReviewWriteRequestModel(
      {this.reviewScore, this.reviewText, this.images, this.tags, this.amenities});

  Map<String, dynamic> toJson() {
    return {
      'reviewScore': reviewScore,
      'reviewText': reviewText,
      'images': images,
      'tags': tags,
      'amenities': amenities,
    };
  }
}