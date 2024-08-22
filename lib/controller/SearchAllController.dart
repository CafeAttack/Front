import 'package:cafe_attack/model/SearchAllModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SearchAllContrller extends GetxController {
  var searchAll = SearchAllModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSearchAllFromJson();
  }

  void fetchSearchAllFromJson() async {
    try {
      isLoading.value = true;
      String _data = await rootBundle.loadString('assets/test/search_all.json');
      Map<String, dynamic> data = json.decode(_data);
      searchAll.value = SearchAllModel.fromJson(data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}