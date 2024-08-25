import 'package:cafe_attack/view/MapView.dart';
import 'package:cafe_attack/view/SignupView.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF2EE),
        body: SingleChildScrollView(
          child: ResponsiveCenter(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Image.asset(
                  'assets/Images/main_logo.png',
                  width: 350,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      ' 아이디',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 26.56,
                    ),
                    Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0x25998686),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      '비밀번호',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 17.22,
                    ),
                    Expanded(
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0x25998686),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "계정이 없다면? ",
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => SignupPage());
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "하기",
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.off(()=>MapPage(act: 0,));
                  },
                  child: Text(
                    "로그인",
                    style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x20564646),
                    side: BorderSide(
                      color: Color(0x50564646),
                      width: 2
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    fixedSize: Size(108, 35)
                ),
                ),
              ],
            ),
            padding: EdgeInsets.all(25),
            maxContentWidth: BreakPoint.tablet,
          ),
        ));
  }
}
