import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapInfoController.dart';
import 'package:cafe_attack/model/MapInfoModel.dart';
import 'package:cafe_attack/view/CafeView.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CafeDetailBottomSheet extends StatefulWidget {
  final int cafeId;

  const CafeDetailBottomSheet({super.key, required this.cafeId});

  @override
  State<CafeDetailBottomSheet> createState() => _CafeDetailBottomSheetState();
}

class _CafeDetailBottomSheetState extends State<CafeDetailBottomSheet> {
  late MapInfoController _mapInfoController;
  var loading = true.obs;
  String rst = "";

  @override
  void initState() {
    super.initState();
    // print("cafeid: ${widget.cafeId}");
    _mapInfoController = Get.put(MapInfoController(widget.cafeId));
    // 실제 작업을 시작
    Future(() {
      rst = _cafeCategory(_mapInfoController.mapInfo.value.categories?.length ?? 0, _mapInfoController.mapInfo.value.categories ?? []);
      setState(() {
        // 로딩 상태를 true로 설정
        loading(false);
      });
    });
  }

  String _cafeCategory(int num, List<int> _categoryId) {
    if (_categoryId == null || _categoryId.isEmpty) return "카테고리 없음";

    String result = "";

    for (int i = 0; i < num && i < _categoryId.length; i++) {
      result += categoryId_text[_categoryId[i]];
      if (i != num - 1 && i != _categoryId.length - 1) {
        result += " / ";
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final MapInfoModel? data = _mapInfoController.mapInfo.value;

      return Obx(() {
        if (_mapInfoController.isLoading.value) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Text("Loading..."),
            ),
          );
        }

        if (data == null) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Text("데이터를 불러오지 못했습니다."),
            ),
          );
        }
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 8),
            width: BreakPoint.tablet,
            height: 400, // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.cafename ?? "카페 이름 없음",
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: freesentation,
                        fontSize: 24,
                        color: Colors.blue,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if ((data.avgscore ?? 0.0) >= 0.5)
                          ...List.generate(
                            (data.avgscore ?? 0.0).floor(),
                                (index) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                        if ((data.avgscore ?? 0.0) >= 0.5 &&
                            (data.avgscore ?? 0.0) - (data.avgscore ?? 0.0).floor() >= 0.5)
                          Icon(
                            Icons.star_half,
                            color: Colors.yellow,
                          ),
                        if ((data.avgscore ?? 0.0) < 0.5)
                          ...List.generate(
                            5,
                            // If avgscore is less than 0.5, show 5 empty stars
                                (index) => Icon(
                              Icons.star_border,
                              color: Colors.yellow,
                            ),
                          ),
                        SizedBox(width: 5),
                        Text(
                          "${data.avgscore?.toStringAsFixed(1) ?? "0.0"}/5.0",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: freesentation,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => FavoriteSave(),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(0), // No rounding for a rectangular shape
                            ),
                          ),
                          backgroundColor: Colors.white,
                        );
                      },
                      icon: data.heart == false
                          ? const Icon(Icons.favorite_border)
                          : const Icon(Icons.favorite),
                    ),
                  ],
                ),
                Text(
                  rst,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  data.address ?? "주소 없음",
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                  ),
                ),
                Text(
                  data.time ?? "운영 시간 없음",
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                  ),
                ),
                Text(
                  data.phone ?? "전화번호 없음",
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "사용자 리뷰",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: freesentation,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      " ${data.reviewcount ?? 0}건",
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: freesentation,
                        fontSize: 20,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                if (data.recentReviews == null || data.recentReviews!.isEmpty)
                  const Text("리뷰가 없습니다")
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      data.recentReviews!.length,
                          (index) {
                        final review = data.recentReviews![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              review.reviewdate ?? "날짜 없음",
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 15,
                              ),
                            ),
                            Image.network(
                              review.picurl ?? 'assets/Images/temporary_logo.png',
                              height: 90,
                              width: 90,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    Get.to(() => CafePage(cafeId: widget.cafeId,));
                  },
                  child: const Text(
                    "더 많은 사용자 리뷰 / 별점 보기 ...",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      );
    }
  }
