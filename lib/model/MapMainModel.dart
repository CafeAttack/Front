class MapMainModel {
  int? status;
  String? message;
  List<Data>? data;

  MapMainModel({this.status, this.message, this.data});

  MapMainModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? cafeId;
  String? cafeName;
  double? latitude;
  double? longitude;

  Data({this.cafeId, this.cafeName, this.latitude, this.longitude});

  Data.fromJson(Map<String, dynamic> json) {
    cafeId = json['cafeId'];
    cafeName = json['cafeName'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafeId'] = this.cafeId;
    data['cafeName'] = this.cafeName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
