import 'package:cafe_attack/MetaData.dart';
import 'package:flutter/material.dart';

class ReviewContainer extends StatefulWidget {
  const ReviewContainer({
    super.key,
    required this.reviewWriter,
    required this.reviewDate,
    required this.reviewScore,
    required this.reviewText,
    required this.reviewPhoto,
  });

  final String reviewWriter;
  final String reviewDate;
  final int reviewScore;
  final String? reviewPhoto; // nullable로 수정

  final String reviewText;

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
                widget.reviewWriter ?? "알 수 없음",
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                widget.reviewDate ?? "??.??.??",
                style: const TextStyle(
                  fontSize: 11,
                  fontFamily: freesentation,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
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
                  widget.reviewText ?? "내용 없음",
                  style: const TextStyle(
                    fontSize: 11,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 8),
                // 이미지가 있는 경우만 표시
                widget.reviewPhoto != null && widget.reviewPhoto!.isNotEmpty
                    ? Image.network(
                  widget.reviewPhoto!,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      "이미지를 불러올 수 없습니다.",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: freesentation,
                        fontWeight: FontWeight.w300,
                        color: Colors.red,
                      ),
                    );
                  },
                )
                    : const SizedBox(), // 이미지가 없을 경우 아무것도 표시하지 않음
              ],
            ),
          ),
        ],
      ),
    );
  }
}