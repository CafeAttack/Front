import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _serchText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveCenter(
          child: Column(
            children: [
              SearchBar(
                controller: _serchText,
                trailing: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _serchText.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ],
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
                shape: MaterialStateProperty.all(
                  ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                textStyle: MaterialStateProperty.all(TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Freesentation',
                ),),
                hintText: "검색어를 입력하세요",
                hintStyle: MaterialStateProperty.all(TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w500,
                  fontFamily: 'Freesentation',),),
              ),
              SizedBox(
                height: 500, // 고정된 높이를 설정
                child: Scrollbar(
                  child: ListView(
                    children: [
                      /* 콘텐츠 추가 */
                    ],
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.all(30),
          maxContentWidth: BreakPoint.tablet,
        ),
      ),
    );
  }
}
