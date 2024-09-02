import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String freesentation = 'Freesentation';
String mapMaker_unclicked = 'https://i.ibb.co/WpvynM0/1.png';
String mapMaker_clicked = 'https://i.ibb.co/j5b0gpj/image.png';
String basic_image = 'assets/Images/temporary_logo.png';

List<String> categoryId = [
  "assets/Images/categoryId_1.png",
  "assets/Images/categoryId_2.png",
  "assets/Images/categoryId_3.png",
  "assets/Images/categoryId_4.png",
  "assets/Images/categoryId_5.png"
];

List<String> categoryId_text = [
  "All",
  "테이크아웃",
  "감성",
  "프랜차이즈",
  "카공",
  "테마"
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

