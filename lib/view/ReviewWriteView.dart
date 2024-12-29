import 'dart:io';

import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/ReviewController.dart';
import 'package:cafe_attack/model/ReviewModel.dart';
import 'package:cafe_attack/view/CafeView.dart';
import 'package:cafe_attack/view/cafeAppBar.dart';
import 'package:cafe_attack/view/resposive/BreakPoint.dart';
import 'package:cafe_attack/view/resposive/ResponsiveCenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReviewWritePage extends StatefulWidget {
  final int cafeId;

  const ReviewWritePage(
      {super.key, required this.cafeId});

  @override
  State<ReviewWritePage> createState() => _ReviewWritePageState();
}

class _ReviewWritePageState extends State<ReviewWritePage> {
  final GlobalKey _appBarKey = GlobalKey();
  late ReviewController reviewController;

  var _selectStarNum = 0;
  var _selectStar1 = false;
  var _selectStar2 = false;
  var _selectStar3 = false;
  var _selectStar4 = false;
  var _selectStar5 = false;
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화
  final List<XFile> _images = []; // 선택된 이미지를 담는 리스트

  List<String> selectedTags = []; // 사용자가 선택한 태그를 저장
  List<bool> checkboxes = [false, false, false, false]; // 화장실, 주차, 흡연, 와이파이 체크박스 상태

  // 태그 선택 로직
  void toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        selectedTags.add(tag);
      }
    });
  }

  // 태그 ID 리스트 생성 (서버에 보낼 데이터)
  List<int> getTagIds() {
    List<int> tagIds = [];
    for (var tag in selectedTags) {
      int index = cafeTags.indexOf(tag);
      if (index != -1) {
        tagIds.add(index + 1); // 태그 ID는 1부터 시작
      }
    }
    return tagIds;
  }

  // 태그를 그룹으로 나누기 (3개씩 묶음)
  List<List<String>> groupTags(List<String> tags, int groupSize) {
    List<List<String>> groupedTags = [];
    for (int i = 0; i < tags.length; i += groupSize) {
      groupedTags.add(tags.sublist(
          i, i + groupSize > tags.length ? tags.length : i + groupSize));
    }
    return groupedTags;
  }

  // 이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    if (_images.length < 5) { // 이미지 10개 제한
      final XFile? pickedFile = await picker.pickImage(source: imageSource);
      if (pickedFile != null) {
        setState(() {
          _images.add(pickedFile); // 선택된 이미지를 리스트에 추가
        });
      }
    } else {
      Get.snackbar('이미지 선택 불가', '최대 5개의 이미지까지 업로드할 수 있습니다.');
    }
  }
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0), // No rounding for a rectangular shape
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 내용의 크기에 맞게 Bottom Sheet의 크기를 조정합니다.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 13, bottom: 13),
                child: Text(
                  "사진 추가",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Divider(thickness: 0.5, height: 1, color: Colors.black),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text(
                  '카메라 촬영',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(
                  '갤러리에서 선택',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: freesentation,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController reviewTextController = TextEditingController();
    reviewController = Get.put(ReviewController(widget.cafeId));
    return Obx(() {
      if (reviewController.isLoading.value ||
          reviewController.reviewResponse.value == null) {
        return Scaffold(body: LoadingScreen());
      }
      ReviewResponseModel reviewResponse = reviewController.reviewResponse.value;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CafeAppBar(
            appBarKey: _appBarKey,
            cafeName: reviewResponse.data?.cafename ?? "카페 이름 없음",
            heart: reviewResponse.data?.isFavor ?? false),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ResponsiveCenter(
            padding: EdgeInsets.zero,
            maxContentWidth: BreakPoint.tablet,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(thickness: 0.5, height: 1, color: Colors.black),
                Expanded(
                  flex: 9,
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "리뷰 작성하기",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: freesentation,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "별점을 선택해 주세요",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontFamily: freesentation,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          child: _selectStar1
                                              ? const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )
                                              : const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (_selectStar1 &&
                                                  _selectStar2) {
                                                _selectStar5 = false;
                                                _selectStar4 = false;
                                                _selectStar3 = false;
                                                _selectStar2 = false;
                                                _selectStarNum = 1;
                                              } else if (_selectStar1 &&
                                                  !_selectStar2) {
                                                _selectStar1 = false;
                                                _selectStarNum = 0;
                                              } else if (!_selectStar1) {
                                                _selectStar1 = true;
                                                _selectStarNum = 1;
                                              }
                                            });
                                          },
                                        ),
                                        GestureDetector(
                                          child: _selectStar2
                                              ? const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )
                                              : const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (_selectStar2) {
                                                _selectStar5 = false;
                                                _selectStar4 = false;
                                                _selectStar3 = false;
                                                _selectStarNum = 2;
                                              } else if (!_selectStar2) {
                                                _selectStar1 = true;
                                                _selectStar2 = true;
                                                _selectStarNum = 2;
                                              }
                                            });
                                          },
                                        ),
                                        GestureDetector(
                                          child: _selectStar3
                                              ? const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )
                                              : const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (_selectStar3) {
                                                _selectStar5 = false;
                                                _selectStar4 = false;
                                                _selectStarNum = 3;
                                              } else if (!_selectStar3) {
                                                _selectStar1 = true;
                                                _selectStar2 = true;
                                                _selectStar3 = true;
                                                _selectStarNum = 3;
                                              }
                                            });
                                          },
                                        ),
                                        GestureDetector(
                                          child: _selectStar4
                                              ? const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )
                                              : const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (_selectStar4) {
                                                _selectStar5 = false;
                                                _selectStarNum = 4;
                                              } else if (!_selectStar4) {
                                                _selectStar1 = true;
                                                _selectStar2 = true;
                                                _selectStar3 = true;
                                                _selectStar4 = true;
                                                _selectStarNum = 4;
                                              }
                                            });
                                          },
                                        ),
                                        GestureDetector(
                                          child: _selectStar5
                                              ? const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )
                                              : const Icon(
                                            Icons.star_border,
                                            color: Colors.yellow,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              if (!_selectStar5) {
                                                _selectStar1 = true;
                                                _selectStar2 = true;
                                                _selectStar3 = true;
                                                _selectStar4 = true;
                                                _selectStar5 = true;
                                                _selectStarNum = 5;
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "$_selectStarNum/5",
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontFamily: freesentation,
                                          fontWeight: FontWeight.w200),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "카페에 대해 소개해주세요!",
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: freesentation,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value: checkboxes[0],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxes[0] =
                                                      value ?? false;
                                                });
                                              },
                                            ),
                                            const Text('화장실 내부에 있어요',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: freesentation,
                                                fontWeight: FontWeight.w300,
                                              ),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value: checkboxes[1],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxes[1] =
                                                      value ?? false;
                                                });
                                              },
                                            ),
                                            const Text('주차가 가능해요',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: freesentation,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value: checkboxes[2],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxes[2] =
                                                      value ?? false;
                                                });
                                              },
                                            ),
                                            const Text('흡연실 있어요',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: freesentation,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value: checkboxes[3],
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxes[3] =
                                                      value ?? false;
                                                });
                                              },
                                            ),
                                            const Text('와이파이가 가능해요',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: freesentation,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Text(
                                  "태그를 선택해주세요",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: freesentation,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 8.0,
                                  runSpacing: 8.0,
                                  children: cafeTags.map((tag) {
                                    final isSelected = selectedTags.contains(
                                        tag);
                                    return GestureDetector(
                                      onTap: () => toggleTag(tag),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.blue.shade100
                                              : Colors.grey.shade200,
                                          borderRadius: BorderRadius.circular(
                                              10.0),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.grey,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Text(
                                          tag,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: isSelected
                                                ? Colors.blue
                                                : Colors.black,
                                            fontWeight:
                                            isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "리뷰를 작성해 주세요",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontFamily: freesentation,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    border:
                                    Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextField(
                                    controller: reviewTextController,
                                    maxLength: 200,
                                    maxLines: 8,
                                    style: const TextStyle(
                                      fontFamily: freesentation,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "사진을 선택해 주세요",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontFamily: freesentation,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      "${_images.length}/5",
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontFamily: freesentation,
                                          fontWeight: FontWeight.w200),
                                    ),
                                    OutlinedButton(
                                      onPressed: () =>
                                          _showImagePicker(context),
                                      style: OutlinedButton.styleFrom(
                                        fixedSize: const Size(75.0, 20.0),
                                        minimumSize: Size.zero,
                                        padding: EdgeInsets.zero,
                                        backgroundColor: const Color(
                                            0x200075FF),
                                        side: const BorderSide(
                                            color: Color(0xff0075FF)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5)),
                                      ),
                                      child: const Text(
                                        "사진 선택하기",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: freesentation,
                                            color: Color(0xFF0075FF)),
                                      ),
                                    )
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (XFile image in _images)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0),
                                          child: Image.file(
                                            File(image.path),
                                            width: 90,
                                            height: 90,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(thickness: 0.5, height: 1, color: Colors.black),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: TextButton(
                    onPressed: () async {
                      List<int> tagIds = getTagIds();
                      String reviewText = reviewTextController.text;
                      List<String> imagesPath=[];


                      for (XFile image in _images) {
                        imagesPath.add(image.path);
                      }

                      /*print("Selected Tag IDs: $tagIds");
                      print("Selected Checkboxes: $checkboxes");
                      print("selected images: ${imagesPath}");*/

                      final reviewModel = ReviewWriteRequestModel(
                        reviewScore: _selectStarNum,
                        reviewText: reviewText,
                        images: imagesPath,
                        tags: tagIds,
                        amenities: checkboxes,
                      );

                      try {
                        bool reviewSuccess = await reviewController.postReview(
                            reviewModel);

                        if(reviewSuccess){
                          Get.off(() => CafePage(cafeId: widget.cafeId,));
                        }
                        else{
                          Get.snackbar("리뷰작성 오류", "다시 작성해주세요");
                        }
                      }catch(e){
                        print("Error: $e");
                      }




                    },
                    child: const Text(
                      "리뷰 등록하기",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: freesentation,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    );
  }
}
