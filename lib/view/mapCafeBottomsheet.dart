import 'dart:ffi';

import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapInfoController.dart';
import 'package:cafe_attack/model/MapInfoModel.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class CafeDetailBottomSheet extends StatefulWidget {
  final LatLng latlag;

  const CafeDetailBottomSheet({super.key, required this.latlag});

  @override
  State<CafeDetailBottomSheet> createState() => _CafeDetailBottomSheetState();
}

class _CafeDetailBottomSheetState extends State<CafeDetailBottomSheet> {
  final MapInfoController _mapInfoController = Get.put(MapInfoController());

  String _cafeCategory(int num, List<int> _categoryId) {
    if (_categoryId == null || _categoryId.isEmpty) return "";

    String result = "";

    for (int i = 0; i < num && i < _categoryId.length; i++) {
      result += categoryId_text[_categoryId[i] - 1];
      if (i != num - 1 && i != _categoryId.length - 1) {
        result += " / ";
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Data? data = _mapInfoController.mapInfo.value.data;

      return Container(
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
                  data!.cafeName == null ? "null" : data.cafeName!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: freesentation,
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...List.generate(
                      double.parse(data.avgScore ?? '0').floor(),
                          (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    if (double.parse(data.avgScore ?? '0') -
                        double.parse(data.avgScore ?? '0').floor() >=
                        0.5)
                      Icon(
                        Icons.star_half,
                        color: Colors.yellow,
                      ),
                    if (double.parse(data.avgScore ?? '0') -
                        double.parse(data.avgScore ?? '0').floor() <
                        0.5 &&
                        double.parse(data.avgScore ?? '0') !=
                            double.parse(data.avgScore ?? '0').floor())
                      Icon(
                        Icons.star_border,
                        color: Colors.yellow,
                      ),
                    SizedBox(width: 5),
                    Text(
                      (data.avgScore ?? "0") + "/5.0",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: freesentation,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => FavoriteSave(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(0), // No rounding for a rectangular shape
                        ),
                      ),
                      backgroundColor: Colors.white,
                    );
                  },
                  icon: Icon(Icons.favorite_border),
                ),
              ],
            ),
            Text(
              _cafeCategory(data.categoryId?.length ?? 0, data.categoryId ?? []),
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              data.address ?? "null",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20,
              ),
            ),
            Text(
              data.time ?? "null",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20,
              ),
            ),
            Text(
              data.phone ?? "null",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "사용자 리뷰",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                  ),
                ),
                Text(
                  " ${data.reviewCnt ?? 0}건",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.review![0].reviewDate ?? "null",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: freesentation,
                          fontSize: 15,
                        ),
                      ),
                      Image.asset(
                        'assets/Images/temporary_logo.png', // todo: Modify to load from network
                        height: 90,
                        width: 90,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.review![1].reviewDate ?? "null",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: freesentation,
                          fontSize: 15,
                        ),
                      ),
                      Image.asset(
                        'assets/Images/temporary_logo.png',
                        height: 90,
                        width: 90,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.review![2].reviewDate ?? "null",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: freesentation,
                          fontSize: 15,
                        ),
                      ),
                      Image.asset(
                        'assets/Images/temporary_logo.png',
                        height: 90,
                        width: 90,
                      )
                    ],
                  ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
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
  }
