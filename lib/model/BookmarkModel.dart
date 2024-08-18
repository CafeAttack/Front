class BookmarkModel {
  int? status;
  String? message;
  List<Groups>? groups;

  BookmarkModel({this.status, this.message, this.groups});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  int? groupId;
  String? groupName;
  List<Cafes>? cafes;

  Groups({this.groupId, this.groupName, this.cafes});

  Groups.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];
    if (json['cafes'] != null) {
      cafes = <Cafes>[];
      json['cafes'].forEach((v) {
        cafes!.add(new Cafes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['groupName'] = this.groupName;
    if (this.cafes != null) {
      data['cafes'] = this.cafes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cafes {
  int? cafeId;
  String? cafeName;
  List<Categories>? categories;

  Cafes({this.cafeId, this.cafeName, this.categories});

  Cafes.fromJson(Map<String, dynamic> json) {
    cafeId = json['cafeId'];
    cafeName = json['cafeName'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cafeId'] = this.cafeId;
    data['cafeName'] = this.cafeName;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? categoryId;

  Categories({this.categoryId});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    return data;
  }
}
