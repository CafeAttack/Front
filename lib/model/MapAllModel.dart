class MapAllModel {
  List<Data>? data;

  MapAllModel({this.data});

  MapAllModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? cafeid;
  double? longitude;
  double? latitude;

  Data({this.cafeid, this.longitude, this.latitude});

  Data.fromJson(Map<String, dynamic> json) {
    cafeid = json['cafeid'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafeid'] = this.cafeid;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
