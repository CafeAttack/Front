class BookmarkAddModel {
  int? status;
  String? message;
  List<Groups>? groups;

  BookmarkAddModel({this.status, this.message, this.groups});

  BookmarkAddModel.fromJson(Map<String, dynamic> json) {
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
  bool? checked;

  Groups({this.groupId, this.groupName, this.checked});

  Groups.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    groupName = json['groupName'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['groupName'] = this.groupName;
    data['checked'] = this.checked;
    return data;
  }
}
