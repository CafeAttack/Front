import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/BookmarkController.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final BookmarkController _bookmarkController = Get.put(BookmarkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2EE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          backgroundColor: Color(0xffFFF2EE),
        ),
      ),
      body: Obx(() {
        // bookmark 데이터를 Obx로 감싸서 상태 변화를 감지
        if (_bookmarkController.bookmark.value.groups == null) {
          return Center(child: CircularProgressIndicator());
        } else if (_bookmarkController.bookmark.value.groups!.isEmpty) {
          return Center(child: Text("즐겨찾기 목록이 없습니다."));
        } else {
          return ResponsiveCenter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "즐겨찾기 목록",
                  style: TextStyle(
                      fontFamily: 'Cafe24',
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Color(0xFF564646)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: _bookmarkController.bookmark.value.groups!.length,
                    itemBuilder: (context, index) {
                      var group = _bookmarkController.bookmark.value.groups![index];
                      return ExpansionTile(
                        title: ListTile(
                          title: Text(group.groupName!,
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w400,
                                fontFamily: freesentation
                            ),
                          ),
                        ),
                        children: group.cafes!.map((cafe) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 30, bottom: 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 180,
                                  height: 40,
                                  child: Text(
                                    cafe.cafeName!,
                                    style: TextStyle(
                                      fontFamily: freesentation,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: cafe.categories!.map((category) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 5.0),
                                      child: Image.asset(categoryId[category.categoryId!-1]),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        shape: null,
                        collapsedShape: null,
                        tilePadding: EdgeInsets.zero, // 패딩도 제거 가능
                      );
                    },
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(30),
          );
        }
      }),
    );
  }
}