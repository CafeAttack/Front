import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF2EE),
        body: SingleChildScrollView(
          child: ResponsiveCenter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xff564646),
                  width: 720,
                  height: 141,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 11,
                          ),
                          Image.asset(
                            'assets/Images/menu_profile.png',
                            width: 112,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'nickname',
                                style: TextStyle(
                                  fontFamily: 'Freesentation',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '즐겨찾기 목록 count',
                                    style: TextStyle(
                                        fontFamily: 'Freesentation',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    '개',
                                    style: TextStyle(
                                        fontFamily: 'Freesentation',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '내 정보 수정',
                                    style: TextStyle(
                                        fontFamily: 'Freesentation',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '즐겨찾기 목록',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w500,
                          fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '로그아웃',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Freesentation',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '계정 탈퇴',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Freesentation',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '개인정보 이용약관',
                        style: TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Freesentation',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '위치정보서비스 이용약관',
                        style: TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Freesentation',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 31,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '개인정보 처리방침',
                        style: TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Freesentation',
                            fontWeight: FontWeight.w500,
                            fontSize: 24
                        ),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero
                      ),
                    )
                  ],
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 24),
            maxContentWidth: BreakPoint.tablet,
          ),
        ));
  }
}
