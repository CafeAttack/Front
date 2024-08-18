import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<Map<String, dynamic>> groups = [
    {'name': '학교 앞 카페', 'checked': false},
    {'name': '홍대 카페', 'checked': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2EE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          backgroundColor: Color(0xffFFF2EE),
        ),
      ),
      body: ResponsiveCenter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "즐겨찾기 목록",
              style: TextStyle(
                  fontFamily: 'Cafe24',
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color(0xFF564646)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: ListTile(
                      title: Text("학교 앞 카페"),
                    ),
                    children: [
                      Container(
                        height: 100,
                        color: Color(0xffFFF2EE),
                        ),
                    ],
                    shape: null,
                    collapsedShape: null,
                    tilePadding: EdgeInsets.zero, // 패딩도 제거 가능
                  );
                },
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(30),
      ),
    );
  }
}
