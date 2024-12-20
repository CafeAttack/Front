import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafe_attack/controller/CafeRecordController.dart';

class RecordEditPage extends StatefulWidget {
  final String cafeName;
  final int visitId;
  final String initialReviewText;
  final DateTime visitDate;
  final int cafeid;

  const RecordEditPage({
    super.key,
    required this.cafeName,
    required this.visitId,
    required this.initialReviewText,
    required this.visitDate,
    required this.cafeid
  });

  @override
  State<RecordEditPage> createState() => _RecordEditPageState();
}

class _RecordEditPageState extends State<RecordEditPage> {
  final TextEditingController _reviewController = TextEditingController();
  final CafeRecordController _controller = Get.find(); // 컨트롤러 연결
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _reviewController.text = widget.initialReviewText;
    _selectedDate = widget.visitDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            colorScheme: const ColorScheme.light(
              primary: Colors.blueAccent,
              onPrimary: Colors.grey,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${widget.cafeName}'),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '카페를 기록해주세요',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "${widget.cafeName} ${widget.visitId}번째 방문 기록",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "방문 일자: $formattedDate",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                    tooltip: "날짜 선택",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _reviewController,
                  maxLines: 8,
                  decoration: const InputDecoration(
                    hintText: '리뷰 내용을 작성하세요...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    String updatedReview = _reviewController.text;
                    if (updatedReview.isEmpty) {
                      Get.snackbar('오류', '리뷰를 작성해주세요!');
                    } else {
                      _controller.updateRecord(
                        widget.visitId,
                        _selectedDate,
                        updatedReview,
                      );
                      Get.back();
                    }
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "기록하기",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
