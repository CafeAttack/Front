import 'package:cafe_attack/model/MapAllModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapAllController extends GetxController {
  var mapAll = MapAllModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMapAllFromJson();
  }

  void fetchMapAllFromJson() async {
    try {
      isLoading.value = true;
      String _data = await rootBundle.loadString('assets/test/map_all.json');
      Map<String, dynamic> data = json.decode(_data);
      mapAll.value = MapAllModel.fromJson(data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}