import 'package:cafe_attack/MetaData.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  int a=0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        print("${a}");
        a++;
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("설빙 광운대점", style: TextStyle(
              fontSize: 20,
              fontFamily: freesentation,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.right,),
            SizedBox(height: 4), // 간격 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 주소와 거리를 좌우로 배치
              children: [
                Text(
                  '서울 노원구 광운로 25 2층',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '358m',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
