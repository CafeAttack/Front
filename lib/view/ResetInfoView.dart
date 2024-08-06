import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetInfoPage extends StatefulWidget {
  const ResetInfoPage({super.key});

  @override
  State<ResetInfoPage> createState() => _ResetInfoPageState();
}

class _ResetInfoPageState extends State<ResetInfoPage> {
  String? id;
  String? name;
  String? originNickname;
  String? e_mail;
  String? originPassword;
  String? checkpasswordHelper;
  String? birth;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkpasswordController = TextEditingController();

  @override
  void initstate() {
    super.initState();
    nicknameController = TextEditingController(text: '$originNickname');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF2EE),
        body: SingleChildScrollView(
          child: ResponsiveCenter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  '내 정보 수정',
                  style: TextStyle(
                      fontFamily: 'Cafe24',
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Color(0xFF564646)
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '아이디',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 226,
                      child: Text(
                        '$id',
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black, width: 1.5
                          )
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 65,
                    ),
                    Text(
                      '이름',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                      width: 226,
                      child: Text(
                        '$name',
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 1.5
                              )
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '닉네임',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 226,
                      child: TextField(
                        controller: nicknameController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5
                            )
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '이메일',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 226,
                      child: Text(
                        'E-mail',
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.5
                          )
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      '비밀번호',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 226,
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '비밀번호\n확인',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Container(
                      width: 226,
                      child: TextField(
                        controller: checkpasswordController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          helperText: checkpasswordHelper,
                          helperStyle: TextStyle(
                            color: Colors.red,
                            fontSize:14,
                            fontWeight: FontWeight.w400
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      '생년월일',
                      style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 226,
                      child: Text(
                        '$birth',
                        style: TextStyle(
                          fontFamily: 'Freesensation',
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black, width: 1.5
                          )
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool success = true;
                    setState(() {
                      if(passwordController.text != checkpasswordController.text) {
                        checkpasswordHelper = "비밀번호가 일치하지 않습니다";
                        success = false;
                      }
                      else {
                        checkpasswordHelper = "";
                        success = true;
                      }
                    });
                  },
                  child: Text(
                    '수정 완료',
                    style: TextStyle(
                        fontFamily: 'Freesensation',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x20564646),
                    side: BorderSide(color: Color(0x50564646), width: 2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    minimumSize: Size(134, 35),
                    // 최소 크기 설정
                    maximumSize: Size(134, 35), // 최대 크기 설정
                  ),
                )
              ],
            ),

            maxContentWidth: BreakPoint.tablet,
          ),
        )
    );
  }
}
