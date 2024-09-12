import 'package:cafe_attack/model/SignUpModel.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

class SignUpController {
  Dio dio = Dio();

  Future<int> email_dup(SignUpModel signupModel, String serverUrl) async{

    // 상태 코드를 검증하는 옵션 설정
    dio.options.validateStatus = (status) {
      return status! < 401; // 500 미만의 상태 코드만 예외로 처리하지 않음
    };

    try {
      Response response = await dio.post('$serverUrl/auth/email-duplication', data: signupModel.email_duplication_toJson());
      if (response.data['status'] == 200) {
        print('이메일 사용 가능: ${response.data['status']} - ${response.data['message']}');
        return 200;
      } else if (response.data['status'] == 400) {
        print('이메일 중복: ${response.data['status']} - ${response.data['message']}');
        return 400;
      }
      return 0; // 모든 경우에 false 반환
    } catch(e) {
      print('이메일 체크 에러: $e');
      return 0;
    }
  }
}