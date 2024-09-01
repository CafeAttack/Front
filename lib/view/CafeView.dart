import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapMoreController.dart';
import 'package:cafe_attack/model/MapMoreModel.dart';
import 'package:cafe_attack/view/cafeAppBar.dart';
import 'package:cafe_attack/view/cafeReviewContainer.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CafePage extends StatefulWidget {
  const CafePage({super.key});

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  final GlobalKey _appBarKey = GlobalKey();
  final GlobalKey _containerKey = GlobalKey();
  double? _remainingHeight;
  final MapMoreController _mapMoreController = Get.put(MapMoreController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _calculateRemainingHeight());
  }

  Future<void> _calculateRemainingHeight() async {
    await Future.delayed(Duration(milliseconds: 20)); // 0.02초 정도 대기
    final RenderBox appBarBox =
        _appBarKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox containerBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    final appBarHeight = appBarBox.size.height;
    final containerHeight = containerBox.size.height;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      _remainingHeight =
          screenHeight - appBarHeight - containerHeight - kToolbarHeight;
    });
  }

  String _cafeCategory(int num, List<int> _categoryId) {
    if (_categoryId == null || _categoryId.isEmpty) return "";

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
    return Obx(() {
      if (_mapMoreController.isLoading.value) {
        return Scaffold(body: LoadingScreen());
      } else {
        MapMoreModel mapMore = _mapMoreController.mapMore.value;
        return Scaffold(
          appBar: CafeAppBar(
              appBarKey: _appBarKey,
              cafeName: mapMore.data!.cafeName!,
              heart: mapMore.data!.heart!),
          body: ResponsiveCenter(
            child: Column(children: [
              Container(
                key: _containerKey,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                padding:
                    EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "위치",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: freesentation,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          width: 80,
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Text(
                            mapMore.data!.address!,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 20),
                          ),
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "영업시간",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: freesentation,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          width: 80,
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Text(
                            mapMore.data!.time!,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 20),
                          ),
                          height: 23,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "전화번호",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: freesentation,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          width: 80,
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Text(
                            mapMore.data!.phone!,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 20),
                          ),
                          height: 23,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            "카페유형",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: freesentation,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          width: 80,
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Text(
                            _cafeCategory(mapMore.data!.categoryId!.length,
                                mapMore.data!.categoryId!),
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 20),
                          ),
                          height: 23,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 8,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "사용자 리뷰",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: freesentation,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          mapMore.data!.reviewCnt.toString() + "건",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: freesentation,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                              double.parse(mapMore.data!.avgScore!).floor(),
                              // Full stars based on the integer part of AvgScore
                              (index) => Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ),
                            if (double.parse(mapMore.data!.avgScore!) -
                                    double.parse(mapMore.data!.avgScore!)
                                        .floor() >=
                                0.5) // Adding a half star if the fractional part is >= 0.5
                              Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              ),
                            if (double.parse(mapMore.data!.avgScore!) -
                                        double.parse(mapMore.data!.avgScore!)
                                            .floor() <
                                    0.5 &&
                                double.parse(mapMore.data!.avgScore!) !=
                                    double.parse(mapMore.data!.avgScore!)
                                        .floor())
                              Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              ),
                            SizedBox(width: 5),
                            Text(
                              mapMore.data!.avgScore! + "/5.0",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: _remainingHeight ?? 400,
                      // Set the calculated height here
                      child: ListView.builder(
                          itemCount:
                              _mapMoreController.mapMore.value.data!.reviewCnt,
                          itemBuilder: (context, index) {
                            List<Review> reviews = mapMore.data!.review!;

                            return ReviewContainer(
                              reviewId: reviews[index].reviewId!,
                              reviewWriter: reviews[index].reviewWriter!,
                              reviewDate: reviews[index].reviewDate!,
                              reviewScore: reviews[index].reviewScore!,
                              reviewText: reviews[index].reviewText!,
                              reviewPhoto: reviews[index].reviewPhoto!,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ]),
            padding: EdgeInsets.zero,
            maxContentWidth: BreakPoint.tablet,
          ),
        );
      }
    });
  }
}
