import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/services/dio_client.dart';
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
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/controller/LoginController.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/config/.env");


  final serverUrl = dotenv.env['SERVER_URL'];
  final apiKey = dotenv.env['API_KEY'];

  WidgetsFlutterBinding.ensureInitialized();
  await DioClient.setupInterceptors();

  runApp(MyApp(serverUrl: serverUrl!));
  AuthRepository.initialize(appKey: apiKey!);
}

class MyApp extends StatelessWidget {
  final String serverUrl;

  const MyApp({super.key, required this.serverUrl});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF564646)),
      ),
      home: LoginPage(serverUrl: serverUrl),
    );
  }
}

