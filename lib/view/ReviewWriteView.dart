import 'package:cafe_attack/view/cafeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewWritePage extends StatefulWidget {
  final cafeName;
  final heart;

  const ReviewWritePage(
      {super.key, required this.cafeName, required this.heart});

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  final GlobalKey _appBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CafeAppBar(
          appBarKey: _appBarKey,
          cafeName: widget.cafeName,
          heart: widget.heart),
    );
  }
}
