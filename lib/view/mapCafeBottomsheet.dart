import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class CafeDetailBottomSheet extends StatefulWidget {
  final LatLng latlag;

  const CafeDetailBottomSheet({super.key, required this.latlag});

  @override
  State<CafeDetailBottomSheet> createState() => _CafeDetailBottomSheetState();
}

class _CafeDetailBottomSheetState extends State<CafeDetailBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.0,left: 16.0,top: 8),
      width: BreakPoint.tablet,
      height: 530, // 높이는 필요에 따라 조정하세요
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "설빙 광운대점",
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
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
            ],
          ),
          Text(
            "프랜차이즈 / 테이크 아웃 카페",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            "서울 노원구 광운로 25 2층",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20),
          ),
          Text(
            "매일 11:00 ~ 23:00 영업",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20),
          ),
          Text(
            "02-6953-9749",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: freesentation,
                fontSize: 20),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "사용자 리뷰",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20),
              ),
              Text(
                " 15건",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: freesentation,
                    fontSize: 20,
                    color: Colors.blue),
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
                    "24.6.14",
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
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "24.5.26",
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
                    "20.6.5",
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
            child: Text("더 많은 사용자 리뷰 / 별점 보기 ...",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                )),
          )
        ],
      ),
    );
  }
}
