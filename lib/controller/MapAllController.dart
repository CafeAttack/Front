import 'package:cafe_attack/model/MapAllModel.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:dio/dio.dart' as dioo;

class MapAllController extends GetxController {
  var mapAll = MapAllModel().obs;
  var isLoading = true.obs;

  double longitude;
  double latitude;
  int radius;

  MapAllController(this.longitude, this.latitude, this.radius);

  @override
  void onInit() {
    super.onInit();
    fetchMapAllFromServer();
  }

  Future<void> fetchMapAllFromServer() async {
    try {
      print("Start loading from server");
      isLoading.value = true;

      // 서버에서 데이터 요청
      dioo.Response response = await DioClient.getRequest(
          '/map/main?category_group_code=CE7&longitude=$longitude&latitude=$latitude&radius=$radius');

      if (response.statusCode == 200) {
        // 서버 응답에서 데이터를 파싱하여 MapAllModel에 저장
        mapAll.value = MapAllModel.fromJson(response.data);

        // 받은 데이터를 콘솔에 출력
        print("Response Data:");
        print(response.data); // 전체 응답 데이터를 출력
        print("Parsed Model Data:");
        print(mapAll.value.toJson()); // 파싱한 모델 데이터를 JSON으로 출력

        print("Finished loading from server");
      } else {
        print("Error: ${response.statusCode} - ${response.statusMessage}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
