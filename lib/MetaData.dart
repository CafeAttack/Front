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

List<String> cafeTags = [
  "커피가 정말 맛있어요.",
  "디저트도 맛있어요!",
  "직원들이 친절해요.",
  "음료가 정말 맛있어요.",
  "매장이 항상 청결해요.",
  "대화하기 좋은 분위기예요.",
  "좌석이 편안해요.",
  "집중하기 좋은 환경이에요.",
  "주차하기 편리해요.",
  "인테리어가 정말 멋져요.",
  "특별한 메뉴도 있어요.",
  "가성비가 아주 좋아요.",
  "화장실이 깨끗해요.",
  "뷰가 정말 좋아요.",
  "사진 찍기 좋은 곳이에요.",
  "매장이 넉넉해요.",
  "아늑한 분위기예요.",
  "차분한 느낌이에요.",
  "오래 머물고 싶어지는 곳이에요.",
  "음식도 맛있어요!",
  "아이와 함께 가기 좋아요.",
  "메뉴 구성이 알차요.",
  "음악도 좋아요.",
  "야외 공간이 멋져요.",
  "비싼 만큼 가치가 있어요.",
  "건강한 맛이에요.",
  "양이 많아서 배부르게 먹어요.",
  "재료가 신선해요.",
  "빵도 맛있어요!",
  "차도 맛있어요.",
  "술 종류가 다양해요.",
  "음료 종류가 다양해요.",
  "단체 모임하기 좋은 곳이에요.",
  "컨셉이 독특해서 눈길을 끌어요.",
  "공부하기 좋아요."
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


