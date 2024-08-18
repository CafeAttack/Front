import 'package:cafe_attack/MetaData.dart';
import 'package:flutter/material.dart';

class ReviewContainer extends StatefulWidget {
  const ReviewContainer(
      {super.key,
      required this.reviewId,
      required this.reviewWriter,
      required this.reviewDate,
      required this.reviewScore,
      required this.reviewText,
      required this.reviewPhoto});

  final int reviewId;
  final String reviewWriter;
  final String reviewDate;
  final int reviewScore;
  final String reviewText;
  final String reviewPhoto;

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
                widget.reviewWriter,
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
                widget.reviewDate,
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
                children: List.generate(5, (index) {
                  // reviewScore 값에 따라 꽉 찬 별 또는 빈 별 표시
                  return Icon(
                    index < widget.reviewScore ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  );
                }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.reviewText,
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
                          basic_image, // todo 백엔드 연결 시 network image로
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
