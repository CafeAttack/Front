import 'dart:convert';
import 'package:get/get.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:cafe_attack/model/CafeRecordModel.dart';
import 'package:cafe_attack/MetaData.dart' as customMeta;

class CafeRecordController extends GetxController {
  var cafeRecordResponse = Rx<CafeRecordResponse?>(null); // 초기값을 null로 설정
  var isLoading = true.obs;
  final int cafeId; // 외부에서 전달받는 cafeId
  int currentMemberId = customMeta.MetaData.memberId; // 현재 사용자 ID
  // 생성자를 통해 currentMemberId와 cafeId를 초기화
  CafeRecordController({required this.cafeId});

  @override
  void onInit() {
    super.onInit();
    fetchCafeRecordsFromServer(); // 서버에서 데이터를 가져오는 함수 호출
  }

  void fetchCafeRecordsFromServer() async {
    try {
      isLoading.value = true;

      // 서버에서 cafeId별 데이터를 가져오는 endpoint 설정
      String endpoint = '/record/$currentMemberId/$cafeId';

      // GET 요청 수행
      final response = await DioClient.getRequest(endpoint);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;

        // 전체 응답을 모델로 변환
        CafeRecordApiResponse apiResponse =
            CafeRecordApiResponse.fromJson(jsonResponse);

        cafeRecordResponse.value = apiResponse.data;
      } else {
        print("Failed to fetch records: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error fetching records from server: $e");
    } finally {
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

    // 서버로 데이터를 업데이트하도록 변경 가능
    await saveRecordToServer(visitId, date, reviewText);
  }

  Future<void> saveRecordToServer(
      int visitId, DateTime date, String reviewText) async {
    try {
      String endpoint = '/record/$currentMemberId/$cafeId';

      // 요청 데이터 생성
      Map<String, dynamic> requestData = {
        'recorddate':
            "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        'recordtext': reviewText,
      };

      // POST 요청 수행 (수정사항 서버 업데이트)
      final response = await DioClient.postRequest(endpoint, requestData);

      if (response.statusCode == 200) {
        print("Record updated successfully on server.");
      } else {
        print("Failed to update record on server: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error updating record on server: $e");
    }
  }

  Future<void> updateExistingRecord(
      int cafeId, int visitId, Map<String, dynamic> data) async {
    String endpoint = '/record/$currentMemberId/$cafeId/$visitId';
    await DioClient.postRequest(endpoint, data);
  }

  Future<void> createNewRecord(int cafeId, Map<String, dynamic> data) async {
    String endpoint = '/record/$currentMemberId/$cafeId/new';
    await DioClient.postRequest(endpoint, data);
  }

}
