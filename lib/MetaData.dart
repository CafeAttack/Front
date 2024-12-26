import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cafe_attack/dio_client.dart';

const String freesentation = 'Freesentation';
String mapMaker_unclicked = 'https://i.ibb.co/WpvynM0/1.png';
String mapMaker_clicked = 'https://i.ibb.co/j5b0gpj/image.png';
String basic_image = 'assets/Images/temporary_logo.png';

class MetaData {
  static String serverUrl = "";
  static String apiKey = "";
  static String accessToken = "";
  static int _memberId = 0;

  static Future<void> initialize() async {
    await dotenv.load(fileName: "assets/config/.env");

    serverUrl = dotenv.env['SERVER_URL'] ?? "";
    apiKey = dotenv.env['API_KEY'] ?? "";

    if (serverUrl.isEmpty || apiKey.isEmpty) {
      throw Exception("환경 변수 로드 실패: SERVER_URL 또는 API_KEY가 없습니다.");
    }
  }

  /// 액세스 토큰 설정 (로그인 시 호출됨)
  static void setAccessToken(String token) {
    accessToken = token;
    DioClient.updateHeaders();
  }

  /// 멤버 ID 설정
  static void setMemberId(int memberId) {
    _memberId = memberId;
  }

  /// 멤버 ID 반환 (다른 클래스에서 읽기 전용으로 사용)
  static int get memberId => _memberId;
}

List<String> categoryId = [
  "assets/Images/categoryId_1.png",
  "assets/Images/categoryId_2.png",
  "assets/Images/categoryId_3.png",
  "assets/Images/categoryId_4.png",
  "assets/Images/categoryId_5.png",
  "assets/Images/categoryId_6.png"
];

List<String> categoryId_text = [
  "All",
  "테이크아웃",
  "감성",
  "프랜차이즈",
  "카공",
  "테마",
  "무인"
];

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: //Spinkit + '이미지별 이름'을 넣어준다 (ex: SpinkitRing , SpinkitWave 등등)
            SpinKitWave(
// 색상을 파란색으로 설정
              color: Color(0xFF6A7BA2),
// 크기를 50.0으로 설정
              size: 50.0,
// 애니메이션 수행 시간을 2초로 설정
              duration: Duration(seconds: 2),
            ),
        ),
    );
  }
}


