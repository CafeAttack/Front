import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/LoginController.dart';
import 'package:cafe_attack/model/LoginModel.dart';
import 'package:cafe_attack/view/MapView.dart';
import 'package:cafe_attack/view/SignupView.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  final String serverUrl;
  const LoginPage({super.key, required this.serverUrl});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _IDcontroller = TextEditingController();
  TextEditingController _PWcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF2EE),
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          padding: const EdgeInsets.all(25),
          maxContentWidth: BreakPoint.tablet,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/Images/main_logo.png',
                width: 350,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Text(
                    ' 아이디',
                    style: TextStyle(
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 26.56,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _IDcontroller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x25998686),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Text(
                    '비밀번호',
                    style: TextStyle(
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 17.22,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _PWcontroller,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0x25998686),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "계정이 없다면? ",
                    style: TextStyle(
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignupPage(serverUrl: widget.serverUrl,));
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "회원가입",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Text(
                    "하기",
                    style: TextStyle(
                      fontFamily: freesentation,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  // 로그인 시도 시 입력된 아이디와 비밀번호를 가져옵니다.
                  String signId = _IDcontroller.text;
                  String password = _PWcontroller.text;
                  String serverUrl = widget.serverUrl;

                  // 로그인 요청을 보낼 LoginModel 생성
                  LoginModel loginModel = LoginModel(signId: signId, password: password);

                  // LoginController 생성
                  LoginController authController = LoginController();

                  try {
                    // 로그인 시도
                    bool loginSuccess = await authController.login(loginModel, serverUrl);

                    // 로그인 결과에 따른 행동
                    if (loginSuccess) {
                      // 로그인 성공 시 MapPage로 이동
                      Get.off(() => MapPage(act: 0, serverUrl: serverUrl,));
                    } else {
                      // 로그인 실패 시 에러 메시지 표시
                      Get.snackbar("로그인 실패", "아이디 또는 비밀번호가 잘못되었습니다.");
                    }
                  } catch (e) {
                    // 에러 발생 시 상태 값, 메시지 등을 디버깅
                    print('로그인 시도 중 오류 발생: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x20564646),
                  side: const BorderSide(color: Color(0x50564646), width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(108, 35),
                ),
                child: const Text(
                  "로그인",
                  style: TextStyle(
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
