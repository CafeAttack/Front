import 'package:cafe_attack/model/MemberMenuModel.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:cafe_attack/controller/MemberMenuController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final MemberMenuController _memberMenuController = Get.put(MemberMenuController());

  void LogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('로그아웃 하겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                print('진행 확인됨');
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void WithdrawalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('탈퇴가 진행됩니다.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('진행');
              },
              child: Text('확인')
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소')
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    int? favor_count = _memberMenuController.Membermenu.value.data!.favorCount;
    String? nickname = _memberMenuController.Membermenu.value.data!.nickname;

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
                                '$nickname',
                                style: TextStyle(
                                  fontFamily: 'Freesentation',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '즐겨찾기 목록 $favor_count',
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
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      '내 정보 수정',
                                      style: TextStyle(
                                        fontFamily: 'Freesentation',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                        color: Colors.black
                                      ),
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
                      onPressed: () {
                        LogoutDialog(context);
                      },
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
                      onPressed: () {
                        WithdrawalDialog(context);
                      },
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
