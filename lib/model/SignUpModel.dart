class SignUpModel {
  String? email;
  int? status;
  String? message;
  Null? data;
  String? authentication;

  SignUpModel({this.email, this.status, this.message, this.data, this.authentication});

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
    data['authentication'] = this.authentication;
    return data;
  }

  SignUpModel.email_verification_fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
}