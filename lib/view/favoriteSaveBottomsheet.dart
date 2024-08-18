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
        return Container(
          padding: EdgeInsets.only(top: 8, left: 16, right: 16),
          height: 400, // You can adjust the height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
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
              Divider(),
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
