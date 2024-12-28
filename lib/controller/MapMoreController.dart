import '../model/MapMoreModel.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:cafe_attack/MetaData.dart' as customMeta;


class MapMoreController extends GetxController {
  var mapMore = MapMoreModel().obs;
  var isLoading = true.obs;  // isLoading 상태 추가

  int cafeId;
  int memberId = customMeta.MetaData.memberId;

  MapMoreController(this.cafeId);

  @override
  void onInit() {
    super.onInit();
    fetchMapMoreFromJson();
  }

  void fetchMapMoreFromJson() async {
    try {
      isLoading(true);  // 로딩 상태로 설정
      dioo.Response response = await DioClient.getRequest("/map/$cafeId/$memberId/more");
      mapMore.value = MapMoreModel.fromJson(response.data);
      print("Parsed Model Data:");
      print(mapMore.value.toJson()); // 파싱한 모델 데이터를 JSON으로 출력
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);  // 작업 완료 후 로딩 상태 해제
    }
  }
}