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
  final String serverUrl;

  const SearchPage({super.key, required this.serverUrl});

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _makeItemContent();
      _calculateRemainingHeight();
    });
    loading(false);
  }

  void _makeItemContent() {
    for (int i = 0;
        i < _searchAllController.searchAll.value.documents!.length;
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
      final screenHeight = MediaQuery.of(context).size.height;
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

  RichText _buildHighlightedText(String text, String searchText) {
    if (searchText.isEmpty) {
      return RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: freesentation,
            fontSize: 20,
          ), // 기본 텍스트 스타일
        ),
      );
    } else {
      List<TextSpan> spans = [];
      int start = 0;

      while (true) {
        // 검색어가 포함된 위치를 찾음
        final int index = text.toLowerCase().indexOf(searchText, start);

        if (index == -1) {
          // 검색어 이후의 남은 텍스트를 추가
          spans.add(TextSpan(
            text: text.substring(start),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontFamily: freesentation,
              fontSize: 20,
            ),
          ));
          break;
        }

        // 검색어 이전의 텍스트를 추가
        if (index > start) {
          spans.add(TextSpan(
            text: text.substring(start, index),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontFamily: freesentation,
              fontSize: 20,
            ),
          ));
        }

        // 검색어 텍스트를 파란색으로 강조
        spans.add(TextSpan(
          text: text.substring(index, index + searchText.length),
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w300,
            fontFamily: freesentation,
            fontSize: 20,
          ),
        ));

        // 검색어 이후의 텍스트를 시작점으로 설정
        start = index + searchText.length;
      }

      return RichText(
        text: TextSpan(children: spans),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return _searchAllController.isLoading.value || loading.value
          ? Scaffold(
              body: LoadingScreen(),
            )
          : Scaffold(

              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    key: _appBarKey,
                  )),
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: ResponsiveCenter(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  maxContentWidth: BreakPoint.tablet,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              key: _searchBarKey,
                              controller: _serchText,
                              onChanged: (value) {
                                setState(() {
                                  searchText = value;
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "카페를 검색하세요...",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: freesentation,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      _serchText.clear();
                                      searchText = _serchText.text;
                                    });
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(() => SearchPage(serverUrl: widget.serverUrl,));
                            },
                            icon: const Icon(Icons.search),
                            iconSize: 30,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(height: 5),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [...buttons],
                            ),
                          ),
                          SizedBox(
                            height: _remainingHeight ?? 400,
                            child: ListView.builder(
                              itemCount: _searchAllController
                                      .searchAll.value.documents!.length ??
                                  0,
                              itemBuilder: (context, idx) {
                                final document = _searchAllController
                                    .searchAll.value.documents![idx];
                                final placeName = document.placeName!;
                                final lowerPlaceName = placeName.toLowerCase();
                                final lowerSearchText =
                                    searchText.toLowerCase();

                                // 검색 기능, 검색어가 있을 경우
                                if (searchText.isNotEmpty &&
                                    !lowerPlaceName.contains(lowerSearchText)) {
                                  return SizedBox
                                      .shrink(); // 검색어와 일치하지 않는 항목은 숨기기
                                } else {
                                  return SearchItem(
                                    distance: document.distance!,
                                    id: document.id!,
                                    placeName: _buildHighlightedText(
                                        placeName, lowerSearchText),
                                    roadAddressName: document.roadAddressName!,
                                    serverUrl: widget.serverUrl,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}

const buttons = [
  SearchButton(text: "All"),
  SearchButton(text: "카공"),
  SearchButton(text: "프렌차이즈"),
  SearchButton(text: "감성"),
  SearchButton(text: "테이크아웃"),
  SearchButton(text: "테마"),
  SearchButton(text: "무인카페"),
];

class SearchButton extends StatelessWidget {
  final String text;

  const SearchButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 17,
          fontFamily: freesentation,
        ),
      ),
    );
  }
}
