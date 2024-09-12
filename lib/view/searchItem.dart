import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/MapView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchItem extends StatefulWidget {
  final RichText placeName;
  final String id;
  final String roadAddressName;
  final int distance;
  final String serverUrl;

  const SearchItem(
      {super.key,
      required this.distance,
      required this.id,
      required this.placeName,
      required this.roadAddressName,
      required this.serverUrl});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  int a = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("${a}, ${widget.id}");
        a++;

        Get.offAll(() => MapPage(
              act: 1,
              cafeId: widget.id,
              serverUrl: widget.serverUrl,
            ));
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
            widget.placeName,
            SizedBox(height: 4), // 간격 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // 주소와 거리를 좌우로 배치
              children: [
                Text(
                  widget.roadAddressName,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.distance.toString() + 'm',
                  style: TextStyle(
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
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
