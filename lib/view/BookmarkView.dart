import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<int> list = [1, 2];



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
                      title: Text("학교 앞 카페",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                        fontFamily: freesentation
                      ),),
                    ),
                    children: [
                      Container(
                        color: Color(0xffFFF2EE),
                        child: Column(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 30,bottom: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 180,
                                    height: 40,
                                    child: Text(
                                      "설빙 광운대점",
                                      style: TextStyle(
                                       fontFamily: freesentation,
                                       fontWeight: FontWeight.w300,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < list.length; i++) ...[
                                        Image.asset(categoryId[list[i]]),
                                        SizedBox(width: 5),
                                      ]
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                        ),
                      )
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
