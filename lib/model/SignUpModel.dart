class SignUpModel {
  int? code;
  int? status;
  String? message;
  Null? data;
  String? signId;
  String? name;
  String? nickname;
  String? email;
  String? password;
  String? checkPassword;
  String? birth;
  bool? agreement;

  SignUpModel({this.email, this.status, this.message, this.data, this.code, this.name,this.nickname, this.password, this.checkPassword, this.birth,this.agreement, this.signId});

  Map<String, dynamic> email_duplication_toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    return data;
  }

  SignUpModel.email_duplication_fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> email_verification_toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['code'] = this.code;
    return data;
  }

  SignUpModel.email_verification_fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> SignUp_toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signId'] = this.signId;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['checkPassword'] = this.checkPassword;
    data['birth'] = this.birth;
    data['agreement'] = this.agreement;
    return data;
  }
}