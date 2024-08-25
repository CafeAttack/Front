import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/SearchAllController.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:cafe_attack/view/searchItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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
  final SearchAllContrller _searchAllController = Get.put(SearchAllContrller());
  List<String> itemContents = [];
  String searchText = '';
  var loading = true.obs;

  // bool _isLoading = true; // 로딩 상태를 관리하는 변수

  @override
  void initState() {
    super.initState();
    // 딜레이 함수 추가
    Future(() {
      _makeItemContent();
      _calculateRemainingHeight();
      loading(false);
    });
  }

  void _makeItemContent() {
    for (int i = 0;
    i < _searchAllController.searchAll.value.documents!.length!;
    i++) {
      itemContents
          .add(_searchAllController.searchAll.value.documents![i].placeName!);
    }
  }

  void _calculateRemainingHeight() {
    // context가 초기화된 후에 실행되는지 확인
    if (_appBarKey.currentContext != null &&
        _searchBarKey.currentContext != null) {
      final RenderBox appBarBox =
      _appBarKey.currentContext!.findRenderObject() as RenderBox;
      final RenderBox searchBarBox =
      _searchBarKey.currentContext!.findRenderObject() as RenderBox;
      final searchBarHeight = searchBarBox.size.height;
      final screenHeight = MediaQuery
          .of(context)
          .size
          .height;
      final appBarHeight = appBarBox.size.height;

      // 높이를 계산하여 상태 업데이트
      setState(() {
        _remainingHeight =
            screenHeight - searchBarHeight - kToolbarHeight - appBarHeight - 30;
        print("Remaining height calculated: $_remainingHeight");
      });
    } else {
      print("Context is null, cannot calculate remaining height");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()
    // 로딩이 끝나면 실제 화면을 보여줌
    {
      return _searchAllController.isLoading.value || loading.value ?
      Scaffold(body: LoadingScreen(),)
          : Scaffold(
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
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
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
                      height: _remainingHeight ?? 400,
                      child: ListView.builder(
                        itemCount: _searchAllController.searchAll.value
                            .documents!.length ?? 0,
                        itemBuilder: (context, idx) {
                          // 검색 기능, 검색어가 있을 경우
                          if (searchText.isNotEmpty &&
                              !_searchAllController.searchAll.value
                                  .documents![idx].placeName!
                                  .toLowerCase()
                                  .contains(searchText.toLowerCase())) {
                            return SizedBox.shrink(); // 검색어와 일치하지 않는 항목은 숨기기
                          } else {
                            return SearchItem(
                              distance: _searchAllController.searchAll.value
                                  .documents![idx].distance!,
                              id: _searchAllController.searchAll.value
                                  .documents![idx].id!,
                              placeName: _searchAllController.searchAll.value
                                  .documents![idx].placeName!,
                              roadAddressName: _searchAllController.searchAll
                                  .value.documents![idx].roadAddressName!,
                            );
                          }
                        },
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
    );
  }
}
