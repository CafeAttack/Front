import '../model/BookmarkModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookmarkController extends GetxController{
  var bookmark = BookmarkModel().obs;

  @override
  void onInit(){
    super.onInit();
    fetchBookmarkFromJson();
  }

  void fetchBookmarkFromJson()async{
    String _data = await rootBundle.loadString('assets/test/bookmark.json');
    Map<String, dynamic> data = json.decode(_data);
    bookmark.value = BookmarkModel.fromJson(data);
  }
}