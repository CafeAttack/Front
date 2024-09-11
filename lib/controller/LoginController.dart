import 'package:cafe_attack/model/LoginModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginController {
  static final storage = FlutterSecureStorage();

  Future<bool> login(LoginModel loginModel, String serverUrl) async {
    Dio dio = Dio();

    try {
      Response response = await dio.post('$serverUrl/auth/login', data: loginModel.toJson());

      if (response.statusCode == 200) {
        // 서버 응답에서 'jwtToken'이 null이 아닌지 확인
        var jwtToken = response.data['data']['jwtToken'];

        if (jwtToken == null || jwtToken['accessToken'] == null) {
          print('로그인 실패: accessToken이 없습니다.');
          return false;
        }

        // 'accessToken' 값 추출
        var token = jwtToken['accessToken'];

        Map<String, dynamic> payload = JwtDecoder.decode(token);
        var loginID = payload['user_id'];

        var loginData = jsonEncode({
          'token': token,
          'loginID': loginID,
        });

        await storage.write(key: 'login', value: loginData);
        print('로그인 성공: ${response.data['status']} - ${response.data['message']}');
        return true;
      } else {
        print('로그인 실패: ${response.data['status']} - ${response.data['message']}');
        return false;
      }
    } catch (e) {
      print('로그인 에러: $e');
      return false;
    }
  }
}