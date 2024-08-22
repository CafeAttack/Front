class SearchAllModel {
  List<Documents>? documents;

  SearchAllModel({this.documents});

  SearchAllModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? placeName;
  String? id;
  String? roadAddressName;
  int? distance;

  Documents({this.placeName, this.id, this.roadAddressName, this.distance});

  Documents.fromJson(Map<String, dynamic> json) {
    placeName = json['place_name'];
    id = json['id'];
    roadAddressName = json['road_address_name'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place_name'] = this.placeName;
    data['id'] = this.id;
    data['road_address_name'] = this.roadAddressName;
    data['distance'] = this.distance;
    return data;
  }
}
