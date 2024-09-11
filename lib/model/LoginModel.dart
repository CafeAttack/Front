class LoginModel {
  String? signId;
  String? password;
  int? status;
  String? message;
  Data? data;

  LoginModel({this.signId, this.password,this.status, this.message, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signId'] = this.signId;
    data['password'] = this.password;
    return data;
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? name;
  JwtToken? jwtToken;

  Data({this.name, this.jwtToken});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    jwtToken = json['jwtToken'] != null
        ? new JwtToken.fromJson(json['jwtToken'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.jwtToken != null) {
      data['jwtToken'] = this.jwtToken!.toJson();
    }
    return data;
  }
}

class JwtToken {
  String? grantType;
  int? memberId;
  String? accessToken;

  JwtToken({this.grantType, this.memberId, this.accessToken});

  JwtToken.fromJson(Map<String, dynamic> json) {
    grantType = json['grantType'];
    memberId = json['memberId'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grantType'] = this.grantType;
    data['memberId'] = this.memberId;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
