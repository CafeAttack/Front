import 'package:cafe_attack/MetaData.dart';
import 'package:flutter/material.dart';

class ReviewContainer extends StatefulWidget {
  const ReviewContainer({super.key});

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "체세연",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "24.06.14",
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "손님도 많이 없고, 종업원이 매우 친절해요!!!"
                  " \n다시 갈 거 같아요!!",
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.clip,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Image.asset(
                          basic_image,
                          width: 90,
                          height: 90,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
