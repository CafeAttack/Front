import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/cafeAppBar.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void _showImagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
            0), // No rounding for a rectangular shape
      ),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내용의 크기에 맞게 Bottom Sheet의 크기를 조정합니다.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 13, bottom: 13),
              child: Text(
                "사진 추가",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(thickness: 0.5, height: 1, color: Colors.black),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('카메라 촬영',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),),
              onTap: () {
                // 카메라 촬영 기능을 호출하는 코드 추가
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('갤러리에서 선택',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),),
              onTap: () {
                // 갤러리에서 이미지를 선택하는 기능을 호출하는 코드 추가
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

class ReviewWritePage extends StatefulWidget {
  final cafeName;
  final heart;

  const ReviewWritePage(
      {super.key, required this.cafeName, required this.heart});

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  final GlobalKey _appBarKey = GlobalKey();
  var _selectStarNum = 0;
  var _selectStar1 = false;
  var _selectStar2 = false;
  var _selectStar3 = false;
  var _selectStar4 = false;
  var _selectStar5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CafeAppBar(
          appBarKey: _appBarKey,
          cafeName: widget.cafeName,
          heart: widget.heart),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ResponsiveCenter(
          padding: EdgeInsets.zero,
          maxContentWidth: BreakPoint.tablet,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 0.5, height: 1, color: Colors.black),
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "리뷰 작성하기",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: freesentation,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "별점을 선택해 주세요",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: freesentation,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: _selectStar1
                                            ? const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                            : const Icon(
                                                Icons.star_border,
                                                color: Colors.yellow,
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (_selectStar1 && _selectStar2) {
                                              _selectStar5 = false;
                                              _selectStar4 = false;
                                              _selectStar3 = false;
                                              _selectStar2 = false;
                                              _selectStarNum = 1;
                                            } else if (_selectStar1 &&
                                                !_selectStar2) {
                                              _selectStar1 = false;
                                              _selectStarNum = 0;
                                            } else if (!_selectStar1) {
                                              _selectStar1 = true;
                                              _selectStarNum = 1;
                                            }
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: _selectStar2
                                            ? const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                            : const Icon(
                                                Icons.star_border,
                                                color: Colors.yellow,
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (_selectStar2) {
                                              _selectStar5 = false;
                                              _selectStar4 = false;
                                              _selectStar3 = false;
                                              _selectStarNum = 2;
                                            } else if (!_selectStar2) {
                                              _selectStar1 = true;
                                              _selectStar2 = true;
                                              _selectStarNum = 2;
                                            }
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: _selectStar3
                                            ? const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                            : const Icon(
                                                Icons.star_border,
                                                color: Colors.yellow,
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (_selectStar3) {
                                              _selectStar5 = false;
                                              _selectStar4 = false;
                                              _selectStarNum = 3;
                                            } else if (!_selectStar3) {
                                              _selectStar1 = true;
                                              _selectStar2 = true;
                                              _selectStar3 = true;
                                              _selectStarNum = 3;
                                            }
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: _selectStar4
                                            ? const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                            : const Icon(
                                                Icons.star_border,
                                                color: Colors.yellow,
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (_selectStar4) {
                                              _selectStar5 = false;
                                              _selectStarNum = 4;
                                            } else if (!_selectStar4) {
                                              _selectStar1 = true;
                                              _selectStar2 = true;
                                              _selectStar3 = true;
                                              _selectStar4 = true;
                                              _selectStarNum = 4;
                                            }
                                          });
                                        },
                                      ),
                                      GestureDetector(
                                        child: _selectStar5
                                            ? const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              )
                                            : const Icon(
                                                Icons.star_border,
                                                color: Colors.yellow,
                                              ),
                                        onTap: () {
                                          setState(() {
                                            if (!_selectStar5) {
                                              _selectStar1 = true;
                                              _selectStar2 = true;
                                              _selectStar3 = true;
                                              _selectStar4 = true;
                                              _selectStar5 = true;
                                              _selectStarNum = 5;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _selectStarNum.toString() + "/5",
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontFamily: freesentation,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              ),
                              const Text(
                                "리뷰를 작성해 주세요",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: freesentation,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const TextField(
                                  maxLength: 200,
                                  maxLines: 8,
                                  style: TextStyle(
                                    fontFamily: freesentation,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "사진을 선택해 주세요",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: freesentation,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "5/10",
                                    style: const TextStyle(
                                        fontSize: 19,
                                        fontFamily: freesentation,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  OutlinedButton(
                                    onPressed: () => _showImagePicker(context),
                                    style: OutlinedButton.styleFrom(
                                      fixedSize: const Size(75.0, 20.0),
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      backgroundColor: const Color(0x200075FF),
                                      side: const BorderSide(
                                          color: Color(0xff0075FF)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    child: const Text(
                                      "사진 선택하기",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: freesentation,
                                          color: Color(0xFF0075FF)),
                                    ),
                                  )
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      Image.asset(
                                        basic_image,
                                        // todo 백엔드 연결 시 network image로
                                        width: 90,
                                        height: 90,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 0.5, height: 1, color: Colors.black),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "리뷰 등록하기",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: freesentation,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
