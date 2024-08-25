import '../model/BookmarkModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookmarkController extends GetxController{
  var bookmark = BookmarkModel().obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
    fetchBookmarkFromJson();
  }

  void fetchBookmarkFromJson()async{
    try{
      isLoading.value = true;
      String _data = await rootBundle.loadString('assets/test/bookmark.json');
      Map<String, dynamic> data = json.decode(_data);
      bookmark.value = BookmarkModel.fromJson(data);
      isLoading.value = false;
    }catch(e){
      print("Error: $e");
    }
  }
}