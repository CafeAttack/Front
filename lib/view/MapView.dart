import 'package:cafe_attack/view/floatingButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var centerLng;
  var centerLat;
  late KakaoMapController mapController;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loading = true;
    getPosition();
  }

  getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    try {
      setState(() {
        // print("경도: ${position.longitude}, 위도: ${position.latitude}");
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
          alignment:
          Alignment(Alignment.bottomRight.x - 0.2, Alignment.bottomRight.y),
          child: SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () async {
                getPosition();
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
      body: centerLat==null?Center(child: CircularProgressIndicator())
      :Stack(
        children: [
          KakaoMap(
            onMapCreated: ((controller) async {
              mapController = controller;
            }),
            center: LatLng(centerLat, centerLng),
          ),

          Positioned(
            top: 30,
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
      ),
    );
  }
}
