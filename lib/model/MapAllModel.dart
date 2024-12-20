class MapAllModel {
  List<Documents>? documents;
  Meta? meta;

  MapAllModel({this.documents, this.meta});

  MapAllModel.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Documents {
  String? id;
  String? x;
  String? y;

  Documents({this.id, this.x, this.y});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}

class Meta {
  bool? isEnd;
  int? pageableCount;
  Null? sameName;
  int? totalCount;

  Meta({this.isEnd, this.pageableCount, this.sameName, this.totalCount});

  Meta.fromJson(Map<String, dynamic> json) {
    isEnd = json['is_end'];
    pageableCount = json['pageable_count'];
    sameName = json['same_name'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_end'] = this.isEnd;
    data['pageable_count'] = this.pageableCount;
    data['same_name'] = this.sameName;
    data['total_count'] = this.totalCount;
    return data;
  }
}
