import 'package:cafe_attack/model/MemberMenuModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class MemberMenuController extends GetxController{
  var Membermenu = MemberMenuModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMemberMenuFromJson();
  }

  void fetchMemberMenuFromJson() async {
    try{
      isLoading(true);
      String _data = await rootBundle.loadString('assets/test/MemberMenu.json');
      Map<String, dynamic> data = json.decode(_data);
      Membermenu.value = MemberMenuModel.fromJson(data);
      isLoading(false);
    }catch(e){
      print("Error: $e");
    }
  }
}