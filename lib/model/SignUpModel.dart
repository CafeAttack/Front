class SignUpModel {
  String? email;
  int? status;
  String? message;
  Null? data;

  SignUpModel({this.email, this.status, this.message, this.data});

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
}