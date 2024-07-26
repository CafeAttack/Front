import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _IDButtonClick = false;
  bool _IDduplication = false;
  bool _IsCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2EE),
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "회원가입",
                style: TextStyle(
                    fontFamily: 'Cafe24',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Color(0xFF564646)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 60,
                    child: Text(
                      ' 아이디',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            helperText: (_IDButtonClick
                                ? (_IDduplication
                                    ? "이미 존재하는 아이디 입니다"
                                    : "사용할 수 있는 아이디 입니다")
                                : null),
                            helperStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: 'Freesentation',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 5,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _IDButtonClick = true;
                                _IDduplication = !_IDduplication;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  color: Color(0x50564646), width: 2),
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2), // padding 조정
                              backgroundColor: Color(0x20564646),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              minimumSize: Size(55, 20), // 최소 크기 설정
                              maximumSize: Size(55, 40), // 최대 크기 설정
                            ),
                            child: Text(
                              '중복확인',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Freesentation',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '닉네임',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '이메일',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0x50564646), width: 2),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      backgroundColor: Color(0x20564646),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      minimumSize: Size(68, 20), // 최소 크기 설정
                      maximumSize: Size(68, 40), // 최대 크기 설정
                    ),
                    child: Text(
                      '이메일 인증',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                    height: 25,
                    child: Text(
                      '비밀번호',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                    height: 55,
                    child: Text(
                      '비밀번호\n확인',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                    height: 25,
                    child: Text(
                      '생년월일',
                      style: TextStyle(
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        // helperText: ,
                        // helperStyle: TextStyle(
                        //   color: Colors.red,
                        //   fontSize: 14,
                        //   fontFamily: 'Freesentation',
                        //   fontWeight: FontWeight.w400,
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _IsCheck = !_IsCheck;
                      });
                    },
                    icon: _IsCheck
                        ? Icon(Icons.check_box_outlined)
                        : Icon(Icons.check_box_outline_blank),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "개인정보 수집",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Freesentation',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Text(
                    "에 동의합니다",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Freesentation',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "회원가입 완료",
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
                        borderRadius: BorderRadius.circular(7)
                    ),
                  minimumSize: Size(145, 35), // 최소 크기 설정
                  maximumSize: Size(145, 35), // 최대 크기 설정
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(30),
          maxContentWidth: BreakPoint.tablet,
        ),
      ),
    );
  }
}
