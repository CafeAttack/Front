import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/favoriteSaveBottomsheet.dart';

class CafeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final GlobalKey appBarKey;
  final String cafeName;
  final bool heart;

  const CafeAppBar(
      {super.key,
      required this.appBarKey,
      required this.cafeName,
      required this.heart});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: appBarKey,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        cafeName,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: freesentation,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => FavoriteSave(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      0), // No rounding for a rectangular shape
                ),
              ),
              backgroundColor: Colors.white,
            );
          },
          icon: heart
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}