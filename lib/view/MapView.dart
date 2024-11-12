import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapAllController.dart';
import 'package:cafe_attack/controller/MapInfoController.dart';
import 'package:cafe_attack/controller/MapMainController.dart';
import 'package:cafe_attack/view/MenuView.dart';
import 'package:cafe_attack/view/SearchView.dart';
import 'package:cafe_attack/view/mapFloatingButton.dart';
import 'package:cafe_attack/view/mapCafeBottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  final int act;
  final String cafeId;
  final String serverUrl;

  const MapPage({required this.act, this.cafeId = "", required this.serverUrl});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  var centerLng;
  var centerLat;
  var radius;
  var actLatLng;
  var actMarkId;
  late KakaoMapController mapController;
  var serverUrl;

  var loading = true.obs;
  late MapAllController _mapAllController;
  List<LatLng> positions = [];
  Set<Marker> markers = {};
  var zoomLevel;

  Timer? debounceTimer;
  bool isFetching = false; // 현재 데이터를 가져오는 중인지 표시

  @override
  void initState() {
    super.initState();
    serverUrl = widget.serverUrl;
    initialize();
  }

  @override
  void dispose() {
    debounceTimer?.cancel(); // 타이머를 해제
    super.dispose();
  }

  Future<void> initialize() async {
    try {
      Position position = await getPosition(); // 위치 정보 가져오기
      centerLng = position.longitude;
      centerLat = position.latitude;


      // 위치 정보를 기반으로 컨트롤러 초기화 (반경 값도 전달)
      _mapAllController = Get.put(MapAllController(widget.serverUrl, centerLng, centerLat, 5000));

      // 서버에서 데이터 불러오기
      await _mapAllController.fetchMapAllFromServer();

      // 마커와 위치 목록 설정
      if (widget.act == 0) {
        makePositionList();
      } else {
        actMakePositionList();
      }


        loading(false); // 모든 작업이 완료된 후 로딩 상태 변경

    } catch (e) {
      print('Initialization error: $e');
    }
  }

  Future<Position> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  void makePositionList() {
    positions.clear(); // 기존 위치 리스트 초기화
    for (int i = 0; i < _mapAllController.mapAll.value.documents!.length; i++) {
      positions.add(LatLng(
        double.parse(_mapAllController.mapAll.value.documents![i].y!),
        double.parse(_mapAllController.mapAll.value.documents![i].x!),
      ));
    }
  }

  void actMakePositionList() {
    for (int i = 0; i < _mapAllController.mapAll.value.documents!.length; i++) {
      positions.add(LatLng(
          double.parse(_mapAllController.mapAll.value.documents![i].y!),
          double.parse(_mapAllController.mapAll.value.documents![i].x!)));
      if (_mapAllController.mapAll.value.documents![i].id == widget.cafeId) {
        actLatLng = LatLng(
            double.parse(_mapAllController.mapAll.value.documents![i].y!),
            double.parse(_mapAllController.mapAll.value.documents![i].x!));
      }
    }
  }

  void _highlightMarker(String cafeId) async {
    // 마커 찾기
    mapController.setCenter(actLatLng);

    int markerId =
        int.parse(cafeId) - 1; // cafeId를 인덱스로 변환 (cafeId는 1부터 시작한다고 가정)
    print("cafe maker index: $markerId");

    if (markerId >= 0 && markerId < markers.length) {
      // 해당 마커를 찾고 활성화
      int index = markers
          .toList()
          .indexWhere((marker) => marker.markerId == markerId.toString());
      Marker targetMarker = markers.elementAt(index);

      // 마커 클릭과 같은 동작 수행
      setState(() {
        int index = markers
            .toList()
            .indexWhere((marker) => marker.markerId == markerId.toString());
        Marker targetMarker = markers.elementAt(index);
        if (index != -1) {
          print("${targetMarker.latLng}, $index, ${markerId}");
          Marker oldMarker = markers.elementAt(index);
          markers.remove(oldMarker);
          markers.add(Marker(
            markerId: markerId.toString(),
            latLng: targetMarker.latLng,
            markerImageSrc: mapMaker_clicked,
            width: 38,
            height: 38,
            offsetX: oldMarker.offsetX,
            offsetY: oldMarker.offsetY,
          ));
        }
      });

      await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CafeDetailBottomSheet(latlag: targetMarker.latLng);
        },
      );

      setState(() {
        int index = markers
            .toList()
            .indexWhere((marker) => marker.markerId == markerId.toString());
        Marker targetMarker = markers.elementAt(index);
        if (index != -1) {
          print("${targetMarker.latLng}, $index, $markerId");
          Marker selectedMarker = markers.elementAt(index);
          markers.remove(selectedMarker);
          markers.add(Marker(
            markerId: markerId.toString(),
            latLng: targetMarker.latLng,
            markerImageSrc: mapMaker_unclicked,
            width: 38,
            height: 38,
            offsetX: selectedMarker.offsetX,
            offsetY: selectedMarker.offsetY,
          ));
        }
      });
    }
  }

  Future<void> getRadiusBasedOnZoom() async {
    // 디바운스 타이머 설정 - 500ms 지연 후에만 실행
    if (debounceTimer?.isActive ?? false) debounceTimer!.cancel();

    debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (isFetching) return; // 데이터 가져오는 중이면 새 요청을 무시
      isFetching = true; // 데이터 가져오는 중으로 표시

      // 현재 카메라 중심 좌표와 줌 레벨 가져오기
      LatLng centerPosition = await mapController.getCenter();
      zoomLevel = await mapController.getLevel();
      print("zoomlevel: $zoomLevel");

      // 줌 레벨에 따른 반경 계산
      int radius = calculateRadius(zoomLevel);

      // 서버에서 데이터 가져오기
      await fetchDataBasedOnRadius(_mapAllController, centerPosition, radius);

      isFetching = false; // 데이터 가져오기가 끝나면 상태 변경
      updateMarkers(); // 마커 업데이트 호출
    });
  }



  // 줌 레벨에 따라 반경을 계산하는 예시 함수
  int calculateRadius(int zoomlevel) {
    if (zoomlevel == 0) {
      return 500;
    } else if (zoomlevel <= 5) {
      return 2500;
    } else if (zoomlevel <= 8) {
      return 40000;
    } else if (zoomlevel <= 10) {
      return 150000;
    } else {
      return 200000;
    }
  }

  // 서버에서 데이터를 가져오는 함수 수정
  Future<void> fetchDataBasedOnRadius(MapAllController mapAllController, LatLng center, int radius) async {
    if (isFetching) return; // 중복 호출 방지

    // mapAllController에 새 중심 위치와 반경 반영
    _mapAllController = Get.put(MapAllController(widget.serverUrl, center.longitude, center.latitude, radius));

    print("Fetching data for radius: $radius meters around ${center.latitude}, ${center.longitude}");

    // 새 데이터 불러오기
    await mapAllController.fetchMapAllFromServer();
    makePositionList(); // 새로운 데이터로 위치 목록 생성
  }


// 마커 데이터를 반영하는 함수
  void updateMarkers() {
    setState(() {
      markers.clear(); // 기존 마커 제거
      for (var position in positions) {
        markers.add(Marker(
          markerId: markers.length.toString(),
          latLng: position,
          markerImageSrc: mapMaker_unclicked,
          width: 38,
          height: 38,
          offsetX: 15,
          offsetY: 44,
        ));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return loading.value || _mapAllController.isLoading.value
          ? const Scaffold(
              body: LoadingScreen(),
            )
          : Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startFloat,
              floatingActionButton: Stack(children: [
                Align(
                  alignment: Alignment(
                      Alignment.bottomRight.x - 0.2, Alignment.bottomRight.y),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () async {
                        LatLng currentPosition =
                            new LatLng(centerLat, centerLng);
                        mapController.setCenter(currentPosition);
                      },
                      backgroundColor: Colors.white,
                      child: Icon(Icons.my_location_rounded),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: LabelChange(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (zoomLevel > 0) {
                            zoomLevel-=1;
                            mapController.setLevel(zoomLevel);
                          }
                          print("확대 : $zoomLevel");
                          setState(() {});
                        },
                        color: Colors.white,
                        child: const Text("확대"),
                      ),
                      const SizedBox(width: 8),
                      MaterialButton(
                        onPressed: () {
                          if (zoomLevel < 15 ) {
                            zoomLevel+=1;
                            mapController.setLevel(zoomLevel);
                          }
                          print("축소 : $zoomLevel");
                          setState(() {});
                        },
                        color: Colors.white,
                        child: const Text("축소"),
                      )
                    ],
                  ),
                ),
              ]),
              body: Stack(
                children: [
                  KakaoMap(
                      onMapCreated: ((controller) async {
                        mapController = controller;
                        getRadiusBasedOnZoom();

                        for (int i = 0; i < positions.length; i++) {
                          markers.add(Marker(
                            markerId: markers.length.toString(),
                            latLng: positions[i],
                            markerImageSrc: mapMaker_unclicked,
                            width: 38,
                            height: 38,
                            offsetX: 15,
                            offsetY: 44,
                          ));
                        }
                        setState(() {});

                        // 여기에서 마커가 설정된 후에 act 값에 따라 특정 마커 활성화
                        if (widget.act == 1 && widget.cafeId.isNotEmpty) {
                          print("start _highlightMarker");
                          _highlightMarker(widget.cafeId);
                        }
                      }),
                      center: LatLng(centerLat, centerLng),
                      markers: markers.toList(),
                      onCameraIdle: (LatLng latLng, int zoomLevel) {
                        getRadiusBasedOnZoom(); // 디바운스된 getRadiusBasedOnZoom 호출
                      },
                      onMarkerTap: (markerId, latLng, zoomLevel) async {
                        mapController.setCenter(latLng);

                        setState(() {
                          int index = markers.toList().indexWhere(
                              (marker) => marker.markerId == markerId);
                          if (index != -1) {
                            print("${latLng}, $index, $markerId");
                            Marker oldMarker = markers.elementAt(index);
                            markers.remove(oldMarker);
                            markers.add(Marker(
                              markerId: markerId,
                              latLng: latLng,
                              markerImageSrc: mapMaker_clicked,
                              width: 38,
                              height: 38,
                              offsetX: oldMarker.offsetX,
                              offsetY: oldMarker.offsetY,
                            ));
                          }
                        });
                        // print("$latLng, $markerId");

                        await showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CafeDetailBottomSheet(latlag: latLng);
                          },
                        );

                        setState(() {
                          int index = markers.toList().indexWhere(
                              (marker) => marker.markerId == markerId);
                          if (index != -1) {
                            print("${latLng}, $index, $markerId");
                            Marker selectedMarker = markers.elementAt(index);
                            markers.remove(selectedMarker);
                            markers.add(Marker(
                              markerId: markerId,
                              latLng: latLng,
                              markerImageSrc: mapMaker_unclicked,
                              width: 38,
                              height: 38,
                              offsetX: selectedMarker.offsetX,
                              offsetY: selectedMarker.offsetY,
                            ));
                          }
                        });
                      }),
                  Positioned(
                    top: 35,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => MenuPage());
                          },
                          icon: Icon(Icons.menu),
                          iconSize: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => SearchPage(serverUrl: widget.serverUrl,));
                            },
                            child: TextFormField(
                              enabled: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '카페를 검색하세요...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Freesentation',
                                ),
                                /*enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: BorderSide.none,
                                ),*/
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(() => SearchPage(serverUrl: widget.serverUrl,));
                          },
                          icon: Icon(Icons.search),
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ));
    });
  }
}
