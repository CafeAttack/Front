import '../model/MapMainModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MapMainController extends GetxController {
  var mapMain = MapMainModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMapMainFromJson();
  }

  void fetchMapMainFromJson() async {
    try {
      isLoading.value = true;
      String _data = await rootBundle.loadString('assets/test/map_main.json');
      Map<String, dynamic> data = json.decode(_data);
      mapMain.value = MapMainModel.fromJson(data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}