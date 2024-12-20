import 'package:dio/dio.dart';
import 'MetaData.dart';

class DioClient {
  static final Dio _dio = Dio();

  static Dio get dio => _dio;

  /// 초기 설정
  static void initialize() {
    _dio.options.baseUrl = MetaData.serverUrl;
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';
  }

  /// 헤더 업데이트 (액세스 토큰 설정)
  static void updateHeaders() {
    _dio.options.headers['Authorization'] = 'Bearer ${MetaData.accessToken}';
  }

  /// 예시: GET 요청
  static Future<Response> getRequest(String endpoint) async {
    try {
      return await _dio.get(endpoint);
    } catch (e) {
      print("GET 요청 오류: $e");
      rethrow;
    }
  }

  /// 예시: POST 요청
  static Future<Response> postRequest(String endpoint, dynamic data) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      print("POST 요청 오류: $e");
      rethrow;
    }
  }
}