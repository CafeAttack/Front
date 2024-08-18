import '../model/BookmarkAddModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class BookmarkAddController extends GetxController{
  var bookmarkAdd = BookmarkAddModel().obs;

  @override
  void onInit(){
    super.onInit();
    fetchBookmarkAddFromJson();
  }

  void fetchBookmarkAddFromJson()async{
    String _data = await rootBundle.loadString('assets/test/bookmark_add.json');
    Map<String, dynamic> data = json.decode(_data);
    bookmarkAdd.value = BookmarkAddModel.fromJson(data);
  }
}