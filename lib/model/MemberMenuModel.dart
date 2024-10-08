class MemberMenuModel {
  int? status;
  String? message;
  Data? data;

  MemberMenuModel({this.status, this.message, this.data});

  MemberMenuModel.fromJson(Map<String, dynamic> json) {
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
  String? nickname;
  int? favorCount;

  Data({this.nickname, this.favorCount});

  Data.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    favorCount = json['favor_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickname'] = this.nickname;
    data['favor_count'] = this.favorCount;
    return data;
  }
}
