import 'package:cafe_attack/model/MemberEditInfoModel.dart';
import 'package:cafe_attack/model/MemberMenuModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class MemeberEditInfocontroller extends GetxController{
  var MemberEditInfo = MemberEditInfoModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchMemberEditInfoFromJson();
  }

  void fetchMemberEditInfoFromJson() async {
    String _data = await rootBundle.loadString('assets/test/MemberEditInfo.json');
    Map<String, dynamic> data = json.decode(_data);
    MemberEditInfo.value = MemberEditInfoModel.fromJson(data);
  }
}