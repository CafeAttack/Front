import 'package:cafe_attack/model/ReviewModel.dart';

import 'package:get/get.dart';
import 'package:cafe_attack/dio_client.dart';
import 'package:dio/dio.dart' as dioo;
import 'package:cafe_attack/MetaData.dart' as customMeta;


class ReviewController extends GetxController {
  var reviewResponse = ReviewResponseModel().obs;
  var isLoading = true.obs;

  int cafeId;
  int memberId = customMeta.MetaData.memberId;

  ReviewController(this.cafeId);

  @override
  void onInit() {
    super.onInit();
    fetchReviewFromJson(); // GET 요청
  }

  // GET 요청 처리
  void fetchReviewFromJson() async {
    try {
      isLoading(true);
      dioo.Response response = await DioClient.getRequest("/review/$memberId/$cafeId");
      reviewResponse.value = ReviewResponseModel.fromJson(response.data);
      print("ReviewResponseModel data: ${reviewResponse.value.data!.isFavor}, ${reviewResponse.value.data!.cafename}");
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  // POST 요청 처리
  Future<bool> postReview(ReviewWriteRequestModel reviewModel) async {
    try {
      isLoading(true);
      print("post 요청문: ${reviewModel.toJson()}");
      dioo.Response response = await DioClient.postRequest(
          "/review/$memberId/$cafeId", reviewModel.toJson());

      if (response.data['status'] == 200) {
        isLoading(false);
        return true;
      } else {
        isLoading(false);
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    } finally {
      isLoading(false);
    }
  }
}