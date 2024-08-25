import 'package:cafe_attack/model/MemberEditInfoModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class MemberEditInfoController extends GetxController{
  var MemberEditInfo = MemberEditInfoModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMemberEditInfoFromJson();
  }

  void fetchMemberEditInfoFromJson() async {
    try{
      isLoading(true);
      String _data =
          await rootBundle.loadString('assets/test/MemberEditInfo.json');
      Map<String, dynamic> data = json.decode(_data);
      MemberEditInfo.value = MemberEditInfoModel.fromJson(data);
      isLoading(false);
    }catch(e){
      print("Error: $e");
    }
  }
}