import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/cupertino.dart';
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
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
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Freesentation',
                  ),
                ),
                hintText: "카페를 검색하세요...",
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Freesentation',
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Freesentation',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "카공",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Freesentation',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "프랜차이즈",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Freesentation',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "감성",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Freesentation',
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "테이크아웃",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Freesentation',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: BreakPoint.tablet, // 고정된 높이를 설정
                    child: Scrollbar(
                      child: ListView(
                        children: [
                          Text(
                            'data',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'data',
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 30, left: 15, right: 15),
          maxContentWidth: BreakPoint.tablet,
        ),
      ),
    );
  }
}
