import 'package:cafe_attack/model/MapInfoModel.dart';

import '../model/MapMoreModel.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:cafe_attack/MetaData.dart' as customMeta;

class MapInfoController extends GetxController {
  var mapInfo = MapInfoModel().obs;
  var isLoading = true.obs;

  int cafeId;
  int memberId = customMeta.MetaData.memberId;

  MapInfoController(this.cafeId);

  @override
  void onInit() {
    super.onInit();
    fetchMapInfoFromJson();
  }

  void fetchMapInfoFromJson() async {
    try {
      isLoading.value=true;
      print("memberId: $memberId");
     
      dioo.Response response = await DioClient.getRequest('/map/$cafeId/$memberId');
      mapInfo.value = MapInfoModel.fromJson(response.data);
      print("Response Data:");
      print(response.data); // 전체 응답 데이터를 출력
      print("Parsed Model Data:");
      print(mapInfo.value.toJson()); // 파싱한 모델 데이터를 JSON으로 출력
      isLoading.value=false;
    } catch (e) {
      print("Error: $e");
    }
  }
}