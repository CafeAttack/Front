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