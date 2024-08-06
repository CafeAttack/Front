import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoPage extends StatefulWidget {
  const EditInfoPage({super.key});

  @override
  State<EditInfoPage> createState() => _EditInfoPageState();
}

class _EditInfoPageState extends State<EditInfoPage> {
  String? originNickname;
  String? originPassword;
  String? checkpasswordHelper;
  String? birth;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkpasswordController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  @override
  void initstate() {
    super.initState();
    nicknameController = TextEditingController(text: '$originNickname');
    birthController = TextEditingController(text: '$birth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFF2EE),
        body: SingleChildScrollView(
          child: ResponsiveCenter(
            child: Column(
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '아이디',
                          style: TextStyle(
                              fontFamily: 'Freesensation',
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                          height: 20,
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
                          height: 20,
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
                          height: 20,
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
                          height: 20,
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
                          height: 20,
                        ),
                        Text(
                          '생년월일',
                          style: TextStyle(
                              fontFamily: 'Freesensation',
                              fontWeight: FontWeight.w500,
                              fontSize: 20
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID',
                          style: TextStyle(
                              fontFamily: 'Freesensation',
                              fontWeight: FontWeight.w400,
                              fontSize: 20
                          ),
                        ),
                        Container(
                          width: 226,
                          height: 1.5,
                          color: Colors.black
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              '*수정 불가능',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                              fontFamily: 'Freesensation',
                              fontWeight: FontWeight.w400,
                              fontSize: 20
                          ),
                        ),
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              '*수정 불가능',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 226,
                          child: TextField(
                            controller: nicknameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
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
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          'E-mail',
                          style: TextStyle(
                              fontFamily: 'Freesensation',
                              fontWeight: FontWeight.w400,
                              fontSize: 20
                          ),
                        ),
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              '*수정 불가능',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: 226,
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
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
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 226,
                          child: TextField(
                            controller: checkpasswordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
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
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 226,
                          child: TextField(
                            controller: birthController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
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
                        Container(
                            width: 226,
                            height: 1.5,
                            color: Colors.black
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 140,
                ),
                ElevatedButton(
                  onPressed: () {
                    //bool success = true;
                    //setState(() {
                      //if(passwordController.text.isEmpty && !checkpasswordController.text.isEmpty) {

                      //}
                    //});
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
            padding: EdgeInsets.all(25),
            maxContentWidth: BreakPoint.tablet,
          ),
        )
    );
  }
}
