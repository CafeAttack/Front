import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/cafeReviewContainer.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CafePage extends StatefulWidget {
  const CafePage({super.key});

  @override
  State<CafePage> createState() => _CafePageState();
}

class _CafePageState extends State<CafePage> {
  GlobalKey _appBarKey = GlobalKey();
  GlobalKey _containerKey = GlobalKey();
  double? _remainingHeight;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _calculateRemainingHeight());
  }

  void _calculateRemainingHeight() {
    final RenderBox appBarBox = _appBarKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox containerBox = _containerKey.currentContext!.findRenderObject() as RenderBox;
    final appBarHeight = appBarBox.size.height;
    final containerHeight = containerBox.size.height;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      _remainingHeight = screenHeight - appBarHeight - containerHeight - kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.expand_more),
        ),
        title: Text(
          "설빙 광운대점",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: freesentation,
            fontSize: 24,
          ),
        ),
        actions: [
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
                        "서울 노원구 광운로 25 2층",
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
                        "매일 11:00 ~ 23:00 영업",
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
                        "02-6953-0749",
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
                        "프랜차이즈 / 테이크 아웃",
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
            padding: const EdgeInsets.only(right: 20, left: 20, top: 8,),
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
                      "15건",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: freesentation,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.yellow,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "4.6/5.0",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontFamily: freesentation,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 10,),
                SizedBox(
                  height: _remainingHeight, // Set the calculated height here
                  child: ListView(
                    children: [
                      ReviewContainer(),
                      ReviewContainer(),
                      ReviewContainer(),
                      ReviewContainer(),
                      ReviewContainer(),
                      ReviewContainer(),
                    ],
                  ),
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
}