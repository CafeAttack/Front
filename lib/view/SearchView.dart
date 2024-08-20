import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:cafe_attack/view/searchItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey _searchBarKey = GlobalKey();
  // GlobalKey _columnKey = GlobalKey();
  double? _remainingHeight;
  GlobalKey _appBarKey = GlobalKey();
  TextEditingController _serchText = new TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _calculateRemainingHeight());
  }

  void _calculateRemainingHeight() {
    final RenderBox appBarBox = _appBarKey.currentContext!.findRenderObject() as RenderBox;
    // final RenderBox columnBox = _columnKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox searchBarBox =
        _searchBarKey.currentContext!.findRenderObject() as RenderBox;
    final searchBarHeight = searchBarBox.size.height;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBarBox.size.height;
    // final columnHeight = columnBox.size.height;

    // Assume that 30 is the top padding and 5 is the vertical margin between elements
    setState(() {
      _remainingHeight = screenHeight - searchBarHeight - kToolbarHeight - appBarHeight-30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            key: _appBarKey,
          )),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ResponsiveCenter(
          child: Column(
            children: [
              SearchBar(
                key: _searchBarKey,
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
                // key: _columnKey,
                children: [
                  SizedBox(height: 5),
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
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "카공",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "프랜차이즈",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "감성",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "테이크아웃",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "테마",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              fontFamily: freesentation,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _remainingHeight, // Use the calculated height
                    child: Scrollbar(
                      thickness: 0,
                      child: ListView(
                        children: [
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                          SearchItem(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          padding: EdgeInsets.only(top: 10, left: 15, right: 15),
          maxContentWidth: BreakPoint.tablet,
        ),
      ),
    );
  }
}
