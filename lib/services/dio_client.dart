import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioClient {
  static final Dio dio = Dio();
  static final storage = FlutterSecureStorage();

  static Future<void> setupInterceptors() async {
    String? token = await storage.read(key: 'login');

    // Interceptors 설정
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (token != null) {
          // 토큰을 Authorization 헤더에 추가
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options); // 요청을 계속 진행
      },
    ));
  }
}