import '../model/MapMoreModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapMoreController extends GetxController {
  var mapMore = MapMoreModel().obs;
  var isLoading = true.obs;  // isLoading 상태 추가

  @override
  void onInit() {
    super.onInit();
    fetchMapMoreFromJson();
  }

  void fetchMapMoreFromJson() async {
    try {
      isLoading(true);  // 로딩 상태로 설정
      String _data = await rootBundle.loadString('assets/test/map_more.json');
      Map<String, dynamic> data = json.decode(_data);
      mapMore.value = MapMoreModel.fromJson(data);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);  // 작업 완료 후 로딩 상태 해제
    }
  }
}