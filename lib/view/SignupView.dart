import 'package:cafe_attack/view/dialog.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final TextEditingController _idController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _nicknameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _pwController = TextEditingController();
final TextEditingController _pwcController = TextEditingController();
final TextEditingController _birthController = TextEditingController();

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _IDButtonClick = false;
  bool _IDduplication = false;
  bool _emailCertification = false;
  bool _IsCheck = false;

  String? _idField;
  String? _nameField;
  String? _nicknameField;
  String? _emailField;
  String? _pwField;
  String? _pwcField;
  String? _birthField;

  bool _isValidEmail(String email) {
    // 이메일 정규식 패턴
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
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
                      '아이디',
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
                          controller: _idController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            helperText: _idField,
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

                                if (_idController.text.isEmpty) {
                                  _idField = "아이디를 입력하세요";
                                } else if (!_IDduplication) {
                                  _idField = "사용 가능한 아이디입니다";
                                } else if (_IDduplication) {
                                  _idField = "이미 존재하는 아이디입니다";
                                } else {
                                  _idField = null;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                  color: Color(0x50564646), width: 2),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // padding 조정
                              backgroundColor: Color(0x00564646),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              minimumSize: Size(55, 20),
                              // 최소 크기 설정
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        helperText: _nameField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        helperText: _nicknameField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        helperText: _emailField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
                    onPressed: () {
                      setState(() {
                        if (_emailController.text.isEmpty) {
                          _emailField = "이메일을 입력하세요";
                        } else if (!_isValidEmail(_emailController.text)) {
                          _emailField = "유효한 이메일을 입력하세요";
                        } else {
                          _emailCertification = true;
                          print(_emailController.text);
                          _emailField = null;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color(0x50564646), width: 2),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      backgroundColor: Color(0x00564646),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      minimumSize: Size(68, 20),
                      // 최소 크기 설정
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
                      controller: _pwController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        helperText: _pwField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
                      controller: _pwcController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        helperText: _pwcField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
                      controller: _birthController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "yyddmm의 형식으로 입력해주세요",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
                        helperText: _birthField,
                        helperStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: 'Freesentation',
                          fontWeight: FontWeight.w400,
                        ),
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
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  bool success = true;
                  setState(() {
                    if (_idController.text.isEmpty) {
                      _idField = "아이디를 입력해주세요";
                      success = false;
                    } else if (!_IDButtonClick) {
                      _idField = "아이디 중복확인을 진행해주세요";
                      success = false;
                    } else if (_IDduplication) {
                      _idField = "이미 존재하는 아이디입니다";
                      success = false;
                    } else {
                      _idField = null;
                      success = true;
                    }

                    if (_nameController.text.isEmpty) {
                      _nameField = "이름을 입력해주세요";
                      success = false;
                    } else {
                      _nameField = null;
                      success = true;
                    }

                    if (_nicknameController.text.isEmpty) {
                      _nicknameField = "닉네임을 입력해주세요";
                      success = false;
                    } else {
                      _nicknameField = null;
                      success = true;
                    }

                    if (_emailController.text.isEmpty) {
                      _emailField = "이메일을 입력해주세요";
                      success = false;
                    } else if (!_emailCertification) {
                      _emailField = "이메일 인증을 진행해주세요";
                      success = false;
                    } else {
                      _emailField = null;
                      success = true;
                    }

                    if (_pwController.text.isEmpty) {
                      _pwField = "비밀번호를 입력해주세요";
                      success = false;
                    } else {
                      _pwField = null;
                      success = true;
                    }

                    if (_pwcController.text.isEmpty) {
                      _pwcField = "비밀번호를 확인해주세요";
                      success = false;
                    } else if (_pwcController.text != _pwController.text) {
                      _pwcField = "비밀번호가 일치하지 않습니다";
                      success = false;
                    } else {
                      _pwcField = null;
                      success = true;
                    }

                    if (_birthController.text.isEmpty) {
                      _birthField = "비밀번호를 확인해주세요";
                      success = false;
                    } else if (_birthController.text.length > 6) {
                      _birthField = "yymmdd 6자리로 입력바랍니다";
                      success = false;
                    } else if (_birthController.text.length < 6) {
                      _birthField = "yymmdd 6자리로 입력바랍니다";
                      success = false;
                    } else {
                      _birthField = null;
                      success = true;
                    }

                    if (success&&!_IsCheck) {
                      showErrorDialog(context, "개인정보 수집 동의", "개인 정보 수집에 동의하지 않으면 가입이 불가합니다", "확인");
                    }
                  });
                  if (success)
                    print("success!!!!");
                  else
                    print("not success ;;");
                },
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
                  side: BorderSide(color: Color(0x50564646), width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: Size(145, 35),
                  // 최소 크기 설정
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
