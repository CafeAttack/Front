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

  SpeedDialChild MapFloatingChild(String _text, Color _color){
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
        onLabelChange(_text);
        print("Click $_text");
      },
    );
  }

  Widget floatingButtons() {
    var buttons = [
      MapFloatingChild("All", Colors.black),
      MapFloatingChild("테이크아웃", Colors.red),
      MapFloatingChild("감성", Colors.orange),
      MapFloatingChild("프렌차이즈", Colors.green),
      MapFloatingChild("카공", Colors.blue),
      MapFloatingChild("테마", Colors.purple),
      MapFloatingChild("무인", Colors.pink),
    ];

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
      buttonSize: Size(50, 50),
      // Adjust button size
      childrenButtonSize: Size(50, 50),
      // Adjust children button size
      spaceBetweenChildren: 5,
      // Adjust spacing between items
      elevation: 2,
      // Adjust shadow for separation
      children: [
        ...buttons
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingButtons();
  }
}

