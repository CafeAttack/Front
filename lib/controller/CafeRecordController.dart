import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:cafe_attack/model/CafeRecordModel.dart';

class CafeRecordController extends GetxController {
  var cafeRecordResponse = Rx<CafeRecordResponse?>(null); // 초기값을 null로 설정
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCafeRecordsFromJson(); // JSON 데이터를 불러오는 함수 호출
  }

  void fetchCafeRecordsFromJson() async {
    try {
      isLoading.value = true;
      String _data = await rootBundle
          .loadString('assets/test/caferecord.json'); // JSON 파일 로드
      Map<String, dynamic> data = json.decode(_data);
      cafeRecordResponse.value = CafeRecordResponse.fromJson(data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
      isLoading.value = false;
    }
  }

  Future<void> updateRecord(
      int visitId, DateTime date, String reviewText) async {
    if (cafeRecordResponse.value == null) return;

    // 기존 records 리스트에서 id가 일치하는 기록을 찾아 수정
    var existingRecord = cafeRecordResponse.value!.records
        .firstWhereOrNull((record) => record.id == visitId);
    if (existingRecord != null) {
      existingRecord.date =
          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      existingRecord.text = reviewText;
    } else {
      // 새로운 기록 추가
      cafeRecordResponse.value!.records.add(Record(
        id: visitId,
        date:
            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        text: reviewText,
      ));
    }

    // JSON 파일에 저장
    await saveCafeRecordsToJson();
  }

  Future<void> saveCafeRecordsToJson() async {
    if (cafeRecordResponse.value == null) return;

    try {
      // JSON으로 변환
      String jsonString = json.encode(cafeRecordResponse.value!.toJson());

      // 파일 저장
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/caferecord.json');
      await file.writeAsString(jsonString);
      print("Records saved successfully!");
    } catch (e) {
      print("Error saving records: $e");
    }
  }
}
