import 'package:cafe_attack/controller/BookmarkAddController.dart';
import 'package:cafe_attack/view/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_attack/MetaData.dart';
import 'package:get/get.dart';

class FavoriteSave extends StatefulWidget {
  const FavoriteSave({super.key});

  @override
  State<FavoriteSave> createState() => _FavoriteSaveState();
}

class _FavoriteSaveState extends State<FavoriteSave> {
  final BookmarkAddController _bookmarkController = Get.put(BookmarkAddController());

  void _toggleCheckbox(int index, bool? value) {
    setState(() {
      // groups[index]['checked'] = value!;
      // todo 수정하기
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 내용의 크기에 맞게 Bottom Sheet의 크기를 조정합니다.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 13, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "즐겨찾기 추가",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: freesentation,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.create_new_folder_outlined),
                      onPressed: () async {
                        String? result = await showInputTextDialog(context, "새로운 그룹 생성", "생성");
                        // print("${result}");
                        // todo 수정하기
                      },
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 0.5, height: 1, color: Colors.black),
              Expanded(
                child: ListView.builder(
                  itemCount: _bookmarkController.bookmarkAdd.value.groups!.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      title: Text(_bookmarkController.bookmarkAdd.value.groups![index].groupName!),
                      value: _bookmarkController.bookmarkAdd.value.groups![index].checked,
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (value) {
                        _toggleCheckbox(index, value);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
