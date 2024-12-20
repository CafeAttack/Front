import 'package:cafe_attack/model/RecordModel.dart'; // Make sure you import the correct model file
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class RecordController extends GetxController {
  var recordResponse = RecordModel(status: 0, message: '', cafes: []).obs; // Initialize with default values
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecordFromJson();
  }

  void fetchRecordFromJson() async {
    try {
      isLoading.value = true;
      String _data = await rootBundle.loadString('assets/test/record.json');
      Map<String, dynamic> data = json.decode(_data);

      // Ensure we properly pass the arguments to RecordModel
      recordResponse.value = RecordModel.fromJson(data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}
