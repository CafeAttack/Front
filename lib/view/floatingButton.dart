import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LabelChange extends StatefulWidget {
  const LabelChange({super.key});

  @override
  _LabelChangeState createState() => _LabelChangeState();
}

// 아이콘 바뀌게 설정하기
class _LabelChangeState extends State<LabelChange> {
  String labelText = "ALL";

  void onLabelChange(String newLabel) {
    setState(() {
      labelText = newLabel;
    });
  }

  Widget floatingButtons() {
    return SpeedDial(
      label: Text(
        labelText,
        style: TextStyle(
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
      buttonSize: Size(60, 60),
      // Adjust button size
      childrenButtonSize: Size(70, 50),
      // Adjust children button size
      spaceBetweenChildren: 5,
      // Adjust spacing between items
      elevation: 2,
      // Adjust shadow for separation
      children: [
        SpeedDialChild(
          labelWidget: SizedBox(
            width: 100,
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: Text(
                "All",
                style: TextStyle(
                    fontFamily: 'Freesentation',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () {
            onLabelChange("All");
          },
        ),
        SpeedDialChild(
          labelWidget: SizedBox(
            width: 100,
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center, // 중앙 정렬
              child: Text(
                "테이크 아웃",
                style: TextStyle(
                  fontFamily: 'Freesentation',
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () {
            onLabelChange("테이크 아웃");
          },
        ),
        SpeedDialChild(
          labelWidget: SizedBox(
            width: 100,
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Text(
                "감성",
                style: TextStyle(
                    fontFamily: 'Freesentation',
                    fontWeight: FontWeight.w600,
                    color: Colors.orange,
                    fontSize: 16.0),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () {
            onLabelChange("감성");
          },
        ),
        SpeedDialChild(
          labelWidget: SizedBox(
            width: 100,
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Text(
                "프렌차이즈",
                style: TextStyle(
                    fontFamily: 'Freesentation',
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                    fontSize: 16.0),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () {
            onLabelChange("프렌차이즈");
          },
        ),
        SpeedDialChild(
          labelWidget: SizedBox(
            width: 100,
            height: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Text(
                "카공",
                style: TextStyle(
                    fontFamily: 'Freesentation',
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                    fontSize: 16.0),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          onTap: () {
            onLabelChange("카공");
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingButtons();
  }
}
