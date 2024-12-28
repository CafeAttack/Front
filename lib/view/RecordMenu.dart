import 'package:cafe_attack/controller/RecordController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CafeRecordPage.dart'; // CafeRecordPage import 추가

class RecordmenuPage extends StatefulWidget {
  const RecordmenuPage({super.key});

  @override
  State<RecordmenuPage> createState() => _RecordmenuPageState();
}

class _RecordmenuPageState extends State<RecordmenuPage> {
  final RecordController _controller = Get.put(RecordController());
  final TextEditingController _searchController = TextEditingController();
  var _filteredCafes = <dynamic>[].obs; // 검색된 카페 리스트

  @override
  void initState() {
    super.initState();
    ever(_controller.recordResponse, (_) {
      _filteredCafes.value = _controller.recordResponse.value.data;
    });
  }

  void _filterSearchResults(String query) {
    final cafes = _controller.recordResponse.value.data;
    if (query.isEmpty) {
      _filteredCafes.value = cafes; // 전체 카페 리스트 보여주기
    } else {
      _filteredCafes.value = cafes
          .where((cafe) =>
              (cafe.cafename ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList(); // 검색 조건에 맞는 카페 필터링
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "나의 방문 카페",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 검색창 UI
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: _filterSearchResults, // 입력 시 필터링 동작
              decoration: InputDecoration(
                hintText: "카페 이름 검색",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (_controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_filteredCafes.isEmpty) {
                return const Center(
                  child: Text("검색 결과가 없습니다."),
                );
              }

              return ListView.builder(
                itemCount: _filteredCafes.length,
                itemBuilder: (context, index) {
                  final cafe = _filteredCafes[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextButton(
                      onPressed: () {
                        // 버튼 클릭 시, cafeid 전달
                        Get.to(() => CafeRecordPage(
                              cafecount: cafe.visitcount ?? 0,
                              cafename: cafe.cafename ?? '이름 없음',
                              cafeid: cafe.cafeId ?? -1, // cafeid 전달
                            ));
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cafe.cafename ?? "이름 없음",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${cafe.visitcount}회 방문 | 마지막 방문 일자: ${cafe.latestvisit}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Divider(thickness: 1, height: 20),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
