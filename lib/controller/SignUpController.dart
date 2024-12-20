import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/model/SignUpModel.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

class SignUpController {

  Future<int> email_dup(SignUpModel signupModel) async {

    try {
      Response response = await DioClient.postRequest('/auth/email-duplication',
          signupModel.email_duplication_toJson());
      if (response.data['status'] == 200) {
        print(
            '이메일 사용 가능: ${response.data['status']} - ${response.data['message']}');
        return 200;
      } else if (response.data['status'] == 400) {
        print(
            '이메일 중복: ${response.data['status']} - ${response.data['message']}');
        return 400;
      }
      return 0; // 모든 경우에 false 반환
    } catch (e) {
      print('이메일 체크 에러: $e');
      return 0;
    }
  }

  Future<int> email_verifi(SignUpModel signupModel) async {


    try {
      Response response = await DioClient.postRequest('/auth/email-verification',
          signupModel.email_verification_toJson());
      if (response.data['status'] == 200) {
        print(
            '인증번호 일치: ${response.data['status']} - ${response.data['message']}');
        return 200;
      } else if (response.data['status'] == 400) {
        print(
            '인증번호 불일치: ${response.data['status']} - ${response.data['message']}');
        return 400;
      }
      return 0; // 모든 경우에 false 반환
    } catch (e) {
      print('이메일 인증번호 에러: $e');
      return 0;
    }
  }

}
