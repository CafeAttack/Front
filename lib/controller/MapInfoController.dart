import 'package:cafe_attack/model/MapInfoModel.dart';

import '../model/MapMoreModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapInfoController extends GetxController {
  var mapInfo = MapInfoModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMapInfoFromJson();
  }

  void fetchMapInfoFromJson() async {
    try {
      isLoading.value=true;
      String _data = await rootBundle.loadString('assets/test/map_info.json');
      Map<String, dynamic> data = json.decode(_data);
      mapInfo.value = MapInfoModel.fromJson(data);
      isLoading.value=false;
    } catch (e) {
      print("Error: $e");
    }
  }
}