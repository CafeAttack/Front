import 'package:cafe_attack/MetaData.dart' as customMetaData;
import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/view/BookmarkView.dart';
import 'package:cafe_attack/view/CafeView.dart';
import 'package:cafe_attack/view/MapView.dart';
import 'package:cafe_attack/view/ReviewWriteView.dart';
import 'package:cafe_attack/view/SearchView.dart';
import 'package:flutter/material.dart';
import 'package:cafe_attack/view/LoginView.dart';
import 'package:cafe_attack/view/SignupView.dart';
import 'package:cafe_attack/view/MenuView.dart';
import 'package:cafe_attack/view/ResetInfoView.dart';

import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/controller/LoginController.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 환경 변수 및 Dio 설정
  await customMetaData.MetaData.initialize();
  DioClient.initialize();

  runApp(MyApp());
  AuthRepository.initialize(appKey: customMetaData.MetaData.apiKey);
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: LoginPage(),
    );
  }
}

