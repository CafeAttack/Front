import 'package:cafe_attack/model/MapAllModel.dart';

import '../model/MapMainModel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:cafe_attack/dio_client.dart';

class MapMainController extends GetxController {
  var mapMain = MapAllModel().obs;
  var isLoading = true.obs;

  int categoryId;
  double longitude;
  double latitude;

  MapMainController(this.categoryId,this.longitude, this.latitude );

  @override
  void onInit() {
    super.onInit();
    fetchMapMainFromJson();
  }

  Future<void> fetchMapMainFromJson() async {
    try {
      isLoading.value = true;
      print("fetchMapMainFromJson: ${categoryId}");
      dioo.Response response = await DioClient.getRequest("/map/main/${categoryId}?longitude=${longitude}&latitude=${latitude}");
      print("Main controller Response data: ${response.data}, ${categoryId}"); // 서버 응답 확인

      mapMain.value = MapAllModel.fromJson(response.data);
      isLoading.value = false;
    } catch (e) {
      print("Error: $e");
    }
  }
}