class MemberEditInfoModel {
  int? status;
  String? signid;
  String? name;
  String? nickname;
  String? email;
  String? birth;
  String? password;

  MemberEditInfoModel(
      {this.status,
        this.signid,
        this.name,
        this.nickname,
        this.email,
        this.birth,
        this.password});

  MemberEditInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    signid = json['signid'];
    name = json['name'];
    nickname = json['nickname'];
    email = json['email'];
    birth = json['birth'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['signid'] = this.signid;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['birth'] = this.birth;
    data['password'] = this.password;
    return data;
  }
}
