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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class MapPage extends StatefulWidget {
  final int act;
  final String cafeId;

  const MapPage({required this.act, this.cafeId = ""});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  var centerLng;
  var centerLat;
  var actLatLng;
  var actMarkId;
  late KakaoMapController mapController;

  // final MapMainController _mapMainController = Get.put(MapMainController());
  var loading = true.obs;
  final MapAllController _mapAllController = Get.put(MapAllController());
  List<LatLng> positions = [];
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();

    // 실제 작업을 시작
    Future(() {
      getPosition();
      if(widget.act==0)
        makePositionList();
      else
        actMakePositionList();
      setState(() {
        // 로딩 상태를 true로 설정
        loading(false);
      });
    });
  }

  void makePositionList() {
    for (int i = 0; i < _mapAllController.mapAll.value.data!.length; i++) {
      positions.add(LatLng(_mapAllController.mapAll.value.data![i].latitude!,
          _mapAllController.mapAll.value.data![i].longitude!));
    }
  }

  void actMakePositionList() {
    for (int i = 0; i < _mapAllController.mapAll.value.data!.length; i++) {
      positions.add(LatLng(_mapAllController.mapAll.value.data![i].latitude!,
          _mapAllController.mapAll.value.data![i].longitude!));
      if(_mapAllController.mapAll.value.data![i].cafeid==widget.cafeId){
        actLatLng = LatLng(_mapAllController.mapAll.value.data![i].latitude!,
            _mapAllController.mapAll.value.data![i].longitude!);
      }
    }
  }

  void _highlightMarker(String cafeId) async {
    // 마커 찾기
    mapController.setCenter(actLatLng);


    int markerId = int.parse(cafeId) - 1; // cafeId를 인덱스로 변환 (cafeId는 1부터 시작한다고 가정)
    print("cafe maker index: $markerId");

    if (markerId >= 0 && markerId < markers.length) {
      // 해당 마커를 찾고 활성화
      int index = markers.toList().indexWhere(
              (marker) => marker.markerId == markerId.toString());
      Marker targetMarker = markers.elementAt(index);


      // 마커 클릭과 같은 동작 수행
      setState(() {
        int index = markers.toList().indexWhere(
                (marker) => marker.markerId == markerId.toString());
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
        int index = markers.toList().indexWhere(
                (marker) => marker.markerId == markerId.toString());
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

  getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    try {
      setState(() {
        centerLng = position.longitude;
        centerLat = position.latitude;
        loading(false);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return loading.value || _mapAllController.isLoading.value
          ? Scaffold(
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
                )
              ]),
              body: Stack(
                children: [
                  KakaoMap(
                      onMapCreated: ((controller) async {
                        mapController = controller;

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
                            Get.to(()=>MenuPage());
                          },
                          icon: Icon(Icons.menu),
                          iconSize: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => SearchPage());
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
                            Get.to(() => SearchPage());
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
