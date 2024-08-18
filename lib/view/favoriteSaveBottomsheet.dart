import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:flutter/material.dart';

class FavoriteSave extends StatefulWidget {
  const FavoriteSave({super.key});

  @override
  State<FavoriteSave> createState() => _FavoriteSaveState();
}

class _FavoriteSaveState extends State<FavoriteSave> {
  List<Map<String, dynamic>> groups = [
    {'name': '학교 앞 카페', 'checked': false},
    {'name': '홍대 카페', 'checked': true},
  ];

  void _addGroup() {
    setState(() {
      groups.add({'name': '새로운 그룹', 'checked': false});
    });
  }

  void _toggleCheckbox(int index, bool? value) {
    setState(() {
      groups[index]['checked'] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8,left: 16,right: 16),
      height: 400,  // You can adjust the height as needed
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
                onPressed: () {
                  _addGroup;
                },
              ),
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(groups[index]['name']),
                  value: groups[index]['checked'],
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
}
