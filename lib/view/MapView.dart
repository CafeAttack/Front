import 'package:cafe_attack/MetaData.dart';
import 'package:cafe_attack/controller/MapInfoController.dart';
import 'package:cafe_attack/controller/MapMainController.dart';
import 'package:cafe_attack/view/mapFloatingButton.dart';
import 'package:cafe_attack/view/mapCafeBottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  var centerLng;
  var centerLat;
  late KakaoMapController mapController;
  final MapMainController _mapMainController = Get.put(MapMainController());
  bool loading = true;
  bool loading2 = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  List<LatLng> positions = [];
  List<String> positions_name = [
    '<div>광운대학교</div>',
    '<div>서울 선곡초등학교</div>',
    '<div>설빙 광운대점</div>'
  ];
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    loading = true;
    loading2 = true;

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Loop the animation

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(seconds: 1), () {
      getPosition();
      makePositionList();
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  makePositionList() {
    for (int i = 0; i < _mapMainController.mapMain.value.data!.length; i++) {
      positions.add(LatLng(_mapMainController.mapMain.value.data![i].latitude!,
          _mapMainController.mapMain.value.data![i].longitude!));
    }
    loading2 = false;
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
        loading = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
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
                  LatLng currentPosition = new LatLng(centerLat, centerLng);
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
        body: Obx(() {
          if (loading || loading2 || _mapMainController.isLoading.value) {
            return Center(
              child: FadeTransition(
                opacity: _animation,
                child: Icon(
                  Icons.coffee, // You can replace this with your desired icon or image
                  size: 100,
                  color: Colors.brown,
                ),
              ),
            );
          } else {
            return Stack(
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
                    }),
                    center: LatLng(centerLat, centerLng),
                    markers: markers.toList(),
                    onMarkerTap: (markerId, latLng, zoomLevel) async {
                      mapController.setCenter(latLng);

                      setState(() {
                        int index = markers.toList().indexWhere(
                                (marker) => marker.markerId == markerId);
                        if (index != -1) {
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
                        onPressed: () {},
                        icon: Icon(Icons.menu),
                        iconSize: 30,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '카페를 검색하세요...',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        iconSize: 30,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        }));
  }
}