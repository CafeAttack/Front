import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/SignUpController.dart';
import 'package:cafe_attack/model/SignUpModel.dart';
import 'package:cafe_attack/view/dialog.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

final TextEditingController _idController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _nicknameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _emailConfirmController = TextEditingController();
final TextEditingController _pwController = TextEditingController();
final TextEditingController _pwcController = TextEditingController();
final TextEditingController _birthController = TextEditingController();

class SignupPage extends StatefulWidget {
  final String serverUrl;

  const SignupPage({super.key, required this.serverUrl});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _IDButtonClick = false;
  bool _emailConfirmClick = false;
  bool _IDduplication = false;
  bool _emailCertification = false;
  bool _IsCheck = false;

  String? _idField;
  String? _nameField;
  String? _nicknameField;
  String? _emailField;
  String? _emailConfirmField;
  String? _pwField;
  String? _pwcField;
  String? _birthField;

  bool _isValidEmail(String email) {
    // 이메일 정규식 패턴
    final RegExp regex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  void _showErrorMessage(String variableType, String message) {
    setState(() {
      switch (variableType) {
        case 'id':
          _idField = message;
          break;
        case 'name':
          _nameField = message;
          break;
        case 'nickname':
          _nicknameField = message;
          break;
        case 'email':
          _emailField = message;
          break;
        case 'emailConfirm':
          _emailConfirmField = message;
          break;
        case 'password':
          _pwField = message;
          break;
        case 'passwordConfirm':
          _pwcField = message;
          break;
        case 'birth':
          _birthField = message;
          break;
        default:
          print('Unknown field');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF2EE),
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          padding: const EdgeInsets.all(30),
          maxContentWidth: BreakPoint.tablet,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "회원가입",
                style: TextStyle(
                    fontFamily: 'Cafe24',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Color(0xFF564646)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 25,
                    width: 60,
                    child: Text(
                      '아이디',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          controller: _idController,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            helperText: _idField,
                            helperStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: freesentation,
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
                              side: const BorderSide(
                                  color: Color(0x50564646), width: 2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // padding 조정
                              backgroundColor: const Color(0x00564646),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              minimumSize: const Size(55, 20),
                              // 최소 크기 설정
                              maximumSize: const Size(55, 40), // 최대 크기 설정
                            ),
                            child: const Text(
                              '중복확인',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: freesentation,
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
              const SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '이름',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        helperText: _nameField,
                        helperStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '닉네임',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        helperText: _nicknameField,
                        helperStyle: const TextStyle(
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
              const SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 60,
                    height: 25,
                    child: Text(
                      '이메일',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        helperText: _emailField,
                        helperStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () async {
                      SignUpModel signupModel =
                          SignUpModel(email: _emailController.text);
                      SignUpController signupController = SignUpController();

                        if (_emailController.text.isEmpty) {
                          _showErrorMessage("email", "이메일을 입력하세요");
                        } else if (!_isValidEmail(_emailController.text)) {
                          _showErrorMessage("email", "유효한 이메일을 입력하세요");
                        } else {
                          try {
                            int email_dup = await signupController.email_dup(
                                signupModel, widget.serverUrl);

                            if (email_dup == 400) {
                              Get.snackbar("중복된 이메일", "이미 회원가입된 이메일입니다");
                              _emailCertification = false;
                            } else if (email_dup == 200) {
                              _emailCertification = true;
                            }
                          } catch (e) {
                            print('이메일 인증 시도 중 문제 발생: $e');
                          }
                          // _emailField = null;
                        }

                    },
                    style: ElevatedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0x50564646), width: 2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      backgroundColor: const Color(0x00564646),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      minimumSize: const Size(68, 20),
                      // 최소 크기 설정
                      maximumSize: const Size(68, 40), // 최대 크기 설정
                    ),
                    child: const Text(
                      '이메일 인증',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 65,
                    height: 55,
                    child: Text(
                      '이메일\n인증번호',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          controller: _emailConfirmController,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            helperText: _emailConfirmField,
                            helperStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontFamily: freesentation,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 5,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  _emailConfirmClick = true;

                                  if (_emailConfirmController.text.isEmpty) {
                                    _emailConfirmField = "인증번호를 입력하세요";
                                  }
                                  /*else if (!_IDduplication) {
                                  _idField = "사용 가능한 아이디입니다";
                                } else if (_IDduplication) {
                                  _idField = "이미 존재하는 아이디입니다";
                                }*/
                                  else {
                                    _emailConfirmField = null;
                                  }
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0x50564646), width: 2),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              // padding 조정
                              backgroundColor: const Color(0x00564646),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              minimumSize: const Size(55, 20),
                              // 최소 크기 설정
                              maximumSize: const Size(55, 40), // 최대 크기 설정
                            ),
                            child: const Text(
                              '인증확인',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: freesentation,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 65,
                    height: 25,
                    child: Text(
                      '비밀번호',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _pwController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        helperText: _pwField,
                        helperStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 65,
                    height: 55,
                    child: Text(
                      '비밀번호\n확인',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _pwcController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        helperText: _pwcField,
                        helperStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 65,
                    height: 25,
                    child: Text(
                      '생년월일',
                      style: TextStyle(
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 26.6,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _birthController,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        hintText: "yyddmm의 형식으로 입력해주세요",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                        helperText: _birthField,
                        helperStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontFamily: freesentation,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
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
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          double bottomPadding =
                              MediaQuery.of(context).viewInsets.bottom;
                          return Padding(
                            padding: EdgeInsets.only(bottom: bottomPadding),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: const Scrollbar(
                                thumbVisibility: true,
                                thickness: 6.0,
                                child: SingleChildScrollView(
                                  physics: ClampingScrollPhysics(),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '이용약관',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                fontFamily: freesentation,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                          // 모달 내부 디자인 영역
                        },
                        backgroundColor:
                            Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      "개인정보 수집",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Text(
                    "에 동의합니다",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
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

                    if (success && !_IsCheck) {
                      showErrorDialog(context, "개인정보 수집 동의",
                          "개인 정보 수집에 동의하지 않으면 가입이 불가합니다", "확인");
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x20564646),
                  side: BorderSide(color: Color(0x50564646), width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: Size(145, 35),
                  // 최소 크기 설정
                  maximumSize: Size(145, 35), // 최대 크기 설정
                ),
                child: const Text(
                  "회원가입 완료",
                  style: TextStyle(
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
