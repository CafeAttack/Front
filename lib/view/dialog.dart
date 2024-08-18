import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errormessageT,
    String errormessageM, String OK) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xff564646),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          errormessageT,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Freesentation',
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(
          errormessageM,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Freesentation',
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              OK,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Freesentation',
                fontWeight: FontWeight.w400,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<String?> showInputTextDialog(BuildContext context, String messageT, String OK) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text(
              messageT,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Freesentation',
                fontWeight: FontWeight.w400,
              ),
            ),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Freesentation',
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '새 그룹',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '그룹 명을 입력해주세요';  // 이 부분에 helperText 메시지를 설정합니다.
                  }
                  return null;  // 문제가 없으면 null을 반환합니다.
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  OK,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Freesentation',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop(controller.text);
                  }
                },
              ),
            ],
          );
        },
      );
    },
  );
}