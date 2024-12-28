import 'package:cafe_attack/controller/CafeRecordController.dart';
import 'RecordEdit.dart'; // 수정 페이지 import
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CafeRecordPage extends StatelessWidget {
  final int cafecount;
  final String cafename;
  final int cafeid; // cafeid 추가

  const CafeRecordPage({
    Key? key,
    required this.cafecount,
    required this.cafename,
    required this.cafeid, // cafeid 초기화
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // CafeRecordController 초기화
    final controller = Get.put(CafeRecordController(
      cafeId: cafeid,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('$cafename'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 카페 방문 횟수와 이름을 표시
            Text(
              '$cafename 을(를) $cafecount 번 방문했어요.',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Obx()로 리액티브 데이터 바인딩
            Obx(() {
              if (controller.isLoading.value) {
                // 데이터 로딩 중
                return const Center(child: CircularProgressIndicator());
              }

              final cafeRecordResponse = controller.cafeRecordResponse.value;

              if (cafeRecordResponse == null ||
                  cafeRecordResponse.records.isEmpty) {
                // 카페 방문 기록이 없을 때
                return const Center(child: Text('방문 기록이 없습니다.'));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: cafeRecordResponse.records.length,
                  itemBuilder: (context, index) {
                    final record = cafeRecordResponse.records[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text(record.date),
                        subtitle: Text(record.text),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // 수정 버튼 클릭 시 RecordEditPage로 이동
                            Get.to(() => RecordEditPage(
                                  cafeName: cafename,
                                  visitId:
                                      record.id, // visitCount 대신 visitId 전달
                                  initialReviewText: record.text, // 기존 리뷰 내용
                                  visitDate:
                                      DateTime.parse(record.date), // 방문 날짜
                                  cafeid: cafeid, // cafeid 전달
                                ))?.then((_) {
                              controller.fetchCafeRecordsFromServer();
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 20),
            // "기록하기" 버튼 추가
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  final cafeRecordResponse =
                      controller.cafeRecordResponse.value;
                  int newId = 0; // 기본값 설정

                  // RecordEditPage로 이동
                  Get.to(() => RecordEditPage(
                        cafeName: cafename,
                        visitId: newId, // 새로운 ID
                        initialReviewText: '', // 내용은 비워둠
                        visitDate: DateTime.now(), // 오늘 날짜
                        cafeid: cafeid, // cafeid 전달
                      ))?.then((_) {
                    controller.fetchCafeRecordsFromServer();
                  });
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "기록하기",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
