import 'package:cafe_attack/model/MapAllModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as Dioo;

class MapAllController extends GetxController {
  var mapAll = MapAllModel().obs;
  var isLoading = true.obs;
  Dioo.Dio dio = Dioo.Dio();

  String serverUrl;
  double longitude;
  double latitude;

  MapAllController(this.serverUrl, this.longitude, this.latitude);

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
      Dioo.Response response = await dio.get(
          '$serverUrl/map/main?category_group_code=CE7&longitude=$longitude&latitude=$latitude&radius=1000');

      if (response.statusCode == 200) {
        // 서버 응답에서 데이터를 파싱하여 MapAllModel에 저장
        mapAll.value = MapAllModel.fromJson(response.data);
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
