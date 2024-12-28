import 'package:cafe_attack/model/RecordModel.dart'; // Ensure the correct model file
import 'package:get/get.dart';
import 'package:cafe_attack/MetaData.dart' as customMeta;
import 'package:cafe_attack/dio_client.dart';

class RecordController extends GetxController {
  var recordResponse = RecordModel(status: 0, message: '', data: [])
      .obs; // Initialize with default values
  var isLoading = true.obs;
  int currentMemberId = customMeta.MetaData.memberId; // 현재 사용자 ID

  @override
  void onInit() {
    super.onInit();
    fetchRecordFromServer(); // 서버에서 데이터 가져오기
  }

  void fetchRecordFromServer() async {
    try {
      isLoading.value = true;

      // 요청 경로 설정
      String endpoint = '/record/$currentMemberId/orderdate';

      // GET 요청 수행
      final response = await DioClient.getRequest(endpoint);

      if (response.statusCode == 200) {
        // 응답 데이터 처리
        Map<String, dynamic> data = response.data;

        // `data` 필드가 null이거나 올바르지 않을 경우 빈 리스트 처리
        if (data['data'] == null || data['data'] is! List) {
          data['data'] = [];
        } else {
          // 날짜 필드 가공 (T 뒤 제거)
          for (var item in data['data']) {
            if (item['latestvisit'] != null && item['latestvisit'] is String) {
              item['latestvisit'] =
                  (item['latestvisit'] as String).split('T').first;
            }
          }
        }

        // RecordModel 변환
        recordResponse.value = RecordModel.fromJson(data);
      } else {
        // 에러 로그 출력
        print("Failed to fetch records: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error fetching records from server: $e");
    } finally {
      isLoading.value = false; // 로딩 상태 해제
    }
  }
}
