import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapMainController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class LabelChange extends StatefulWidget {
  final ValueChanged<int> onCategorySelected;

  const LabelChange({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  _LabelChangeState createState() => _LabelChangeState();
}

class _LabelChangeState extends State<LabelChange> {
  String labelText = "ALL";
  final int categoryId = 1;

  void onLabelChange(String newLabel, categoryId) {
    setState(() {
      labelText = newLabel;
    });
    print("onLabelChange: $categoryId");
    widget.onCategorySelected(categoryId); // 선택된 카테고리 ID 전달
  }

  SpeedDialChild MapFloatingChild(String _text, Color _color, categoryId) {
    return SpeedDialChild(
      labelWidget: SizedBox(
        width: 80,
        height: 40,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          alignment: Alignment.center,
          child: Text(
            _text,
            style: TextStyle(
                fontFamily: 'Freesentation',
                fontWeight: FontWeight.w600,
                color: _color,
                fontSize: 14.0),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      onTap: () {
        onLabelChange(_text, categoryId); // 카테고리 변경
        print("Selected category: $_text, $categoryId");
      },
    );
  }

  Widget floatingButtons() {
    var buttons = [
      MapFloatingChild("All", Colors.black, 1),
      MapFloatingChild("테이크아웃", Colors.red, 2),
      MapFloatingChild("감성", Colors.orange, 3),
      MapFloatingChild("프렌차이즈", Colors.green, 4),
      MapFloatingChild("카공", Colors.blue, 5),
      MapFloatingChild("테마", Colors.purple, 6),
      MapFloatingChild("무인", Colors.pink, 7),
    ];

    return SpeedDial(
      label: Text(
        labelText,
        style: const TextStyle(
          fontFamily: 'Freesentation',
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      animatedIcon: AnimatedIcons.ellipsis_search,
      visible: true,
      curve: Curves.bounceIn,
      backgroundColor: Colors.white,
      direction: SpeedDialDirection.up,
      switchLabelPosition: true,
      buttonSize: Size(50, 50),
      childrenButtonSize: Size(50, 50),
      spaceBetweenChildren: 5,
      elevation: 2,
      children: [...buttons],
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingButtons();
  }
}



