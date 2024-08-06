import 'package:cafe_attack/view/MapView.dart';
import 'package:flutter/material.dart';
import 'package:cafe_attack/view/LoginView.dart';
import 'package:cafe_attack/view/SignupView.dart';
import 'package:cafe_attack/view/MenuView.dart';
import 'package:cafe_attack/view/ResetInfoView.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

void main() {
  runApp(const MyApp());
  AuthRepository.initialize(appKey: '60c2aaaa6b9b22b03b1cbdd54bbea37d');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF564646)),
      ),
      home: ResetInfoPage(),
    );
  }
}

