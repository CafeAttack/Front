import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapMoreController.dart';
import 'package:cafe_attack/model/MapMoreModel.dart';
import 'package:cafe_attack/view/ReviewWriteView.dart';
import 'package:cafe_attack/view/cafeAppBar.dart';
import 'package:cafe_attack/view/cafeReviewContainer.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CafePage extends StatefulWidget {
  final int cafeId; // cafeId를 받는 변수 추가

  const CafePage({super.key, required this.cafeId}); // cafeId를 필수 인자로 받음


  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  final GlobalKey _appBarKey = GlobalKey();
  late MapMoreController _mapMoreController;

  String _cafeCategory(int num, List<int> _categoryId) {
    if (_categoryId == null || _categoryId.isEmpty) return "카테고리 없음";

    String result = "";

    for (int i = 0; i < num && i < _categoryId.length; i++) {
      result += categoryId_text[_categoryId[i]-1];
      if (i != num - 1 && i != _categoryId.length - 1) {
        result += " / ";
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    _mapMoreController = Get.put(MapMoreController(widget.cafeId ));
    return Obx(() {
      if (_mapMoreController.isLoading.value ||
          _mapMoreController.mapMore.value == null) {
        return Scaffold(body: LoadingScreen());
      }

      MapMoreModel mapMore = _mapMoreController.mapMore.value;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CafeAppBar(
          appBarKey: _appBarKey,
          cafeName: mapMore.cafename ?? "카페 이름 없음",
          heart: mapMore.heart ?? false,
        ),
        body: ResponsiveCenter(
          child: SingleChildScrollView(

            child: Column(children: [
              Container(
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
                padding: EdgeInsets.only(right: 10, left: 10, top: 8, bottom: 8),
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
                            mapMore.address ?? "주소 없음",
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
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          width: 80,
                          height: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            mapMore.time ?? "영업시간 없음",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: freesentation,
                              fontSize: 20,
                            ),
                            softWrap: true, // 줄바꿈 허용
                            overflow: TextOverflow.ellipsis, // 텍스트가 너무 길 경우 말줄임표 처리
                            maxLines: 2, // 최대 2줄로 표시
                          ),
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
                            mapMore.phone ?? "정보 없음",
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
                            _cafeCategory(mapMore.categories?.length ?? 0,
                                mapMore.categories ?? []),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "편의 시설",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: freesentation,
                              fontWeight: FontWeight.w600,
                          ),
                        ),
                        Wrap(
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: (mapMore.amenities?[0].name ?? "f") == "t"? true:false, // 기본값: 선택되지 않음
                                  onChanged: (bool? value) {
                                    // 선택 시 로직 추가
                                  },
                                ),
                                Text('화장실 내부에 있어요',
                                  style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: freesentation,
                                  fontWeight: FontWeight.w300,
                                ),),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: (mapMore.amenities?[1].name ?? "f") == "t"? true:false,
                                  onChanged: (bool? value) {
                                    // 선택 시 로직 추가
                                  },
                                ),
                                Text('주차가 가능해요',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: freesentation,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: (mapMore.amenities?[2].name ?? "f") == "t"? true:false,
                                  onChanged: (bool? value) {
                                    // 선택 시 로직 추가
                                  },
                                ),
                                Text('흡연실 있어요',
                                  style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: freesentation,
                                  fontWeight: FontWeight.w300,
                                ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: (mapMore.amenities?[3].name ?? "f") == "t"? true:false,
                                  onChanged: (bool? value) {
                                    // 선택 시 로직 추가
                                  },
                                ),
                                Text('와이파이가 가능해요',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: freesentation,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "사용자 리뷰",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: freesentation,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          (mapMore.reviews?.length ?? 0).toString() + "건",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: freesentation,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if ((mapMore.avgscore ?? 0.0) > 0)
                              ...List.generate(
                                (mapMore.avgscore ?? 0.0).floor(),
                                // Full stars based on the integer part of AvgScore
                                    (index) => Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ),
                            if ((mapMore.avgscore ?? 0.0) > 0 &&
                                (mapMore.avgscore ?? 0.0) - (mapMore.avgscore ?? 0.0).floor() >= 0.5)
                              Icon(
                                Icons.star_half,
                                color: Colors.yellow,
                              ),
                            if ((mapMore.avgscore ?? 0.0) > 0 &&
                                (mapMore.avgscore ?? 0.0) - (mapMore.avgscore ?? 0.0).floor() < 0.5 &&
                                (mapMore.avgscore ?? 0.0) != (mapMore.avgscore ?? 0.0).floor())
                              Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              ),
                            if ((mapMore.avgscore ?? 0.0) == 0)
                              ...List.generate(
                                5,
                                // If avgscore is 0, show 5 empty stars
                                    (index) => Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                              ),
                            Text(
                              "${mapMore.avgscore ?? 0.0}/5.0",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.to(() => ReviewWritePage(
                                cafeName: mapMore.cafename!,
                                heart: mapMore.heart!));
                          },
                          child: Text(
                            "리뷰쓰기",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: freesentation,
                                color: Color(0xFF0075FF)),
                          ),
                          style: OutlinedButton.styleFrom(
                            fixedSize: Size(53.0, 20.0),
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            backgroundColor: Color(0x200075FF),
                            side: BorderSide(color: Color(0xff0075FF)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "이런 점이 좋았아요",
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: (mapMore.tags?.length ?? 0) * 60.0, // ListView의 높이를 아이템 개수에 맞게 조정
                      child: ListView.builder(
                        itemCount: mapMore.tags?.length ?? 0, // 태그 데이터 개수
                        physics: NeverScrollableScrollPhysics(), // 내부 스크롤 방지
                        itemBuilder: (context, index) {
                          List<Tags> tags = mapMore.tags ?? []; // 태그 리스트 가져오기
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0), // 아이템 간 간격 추가
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffdbefff), // 배경 색상
                                borderRadius: BorderRadius.circular(10), // 모서리 둥글게
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // 내부 패딩
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "✨", // 태그에 따른 이모지
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '"${tags[index].tag}"', // 태그 이름
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    tags[index].count.toString(), // 태그 카운트
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: mapMore.reviews?.length ?? 0,
                          itemBuilder: (context, index) {
                            List<Reviews> reviews = mapMore.reviews ??[];
            
                            return ReviewContainer(
                              reviewWriter: reviews[index].nickname!,
                              reviewDate: reviews[index].reviewdate!,
                              reviewScore: reviews[index].reviewscore!,
                              reviewText: reviews[index].reviewtext!,
                              reviewPhoto: reviews[index].picurl,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          padding: EdgeInsets.zero,
          maxContentWidth: BreakPoint.tablet,
        ),
      );
    });
  }
}