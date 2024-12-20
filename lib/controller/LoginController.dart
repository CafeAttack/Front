import 'package:cafe_attack/model/LoginModel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/MetaData.dart' as customMeta;
import 'dart:convert';

class LoginController {
  static final storage = FlutterSecureStorage();

  /// 로그인 함수
  Future<bool> login(LoginModel loginModel) async {
    try {
      // 로그인 요청
      var response = await DioClient.postRequest(
        '/auth/login',
        loginModel.toJson(),
      );

      // 상태 코드 확인
      if (response.statusCode == 200) {
        var jwtToken = response.data['data']['jwtToken'];

        // 토큰 검증
        if (jwtToken == null || jwtToken['accessToken'] == null) {
          print('로그인 실패: accessToken이 없습니다.');
          return false;
        }

        // 토큰 저장
        var token = jwtToken['accessToken'];
        var memberId = jwtToken['memberId'];

        Map<String, dynamic> payload = JwtDecoder.decode(token);
        var loginID = payload['user_id'];

        var loginData = jsonEncode({
          'token': token,
          'loginID': loginID,
        });

        // Secure Storage에 저장
        await storage.write(key: 'login', value: loginData);

        // DioClient 헤더 업데이트
        // MetaData에 토큰과 멤버 ID 설정
        customMeta.MetaData.setAccessToken(token);
        customMeta.MetaData.setMemberId(memberId);

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