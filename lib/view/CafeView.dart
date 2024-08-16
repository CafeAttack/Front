import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  var centerLng;
  var centerLat;
  late KakaoMapController mapController;
  bool loading = true;
  List<LatLng> positions = [
    LatLng(37.6198, 127.0598),
    LatLng(37.6184, 127.0581),
    LatLng(37.6200, 127.0562)
  ];
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    loading = true;
    getPosition();
  }

  getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    setState(() {
      // print("경도: ${position.longitude}, 위도: ${position.latitude}");
      centerLng = position.longitude;
      centerLat = position.latitude;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return KakaoMap(
      onMapCreated: ((controller) async {
        mapController = controller;

        markers.add(Marker(
          markerId: markers.length.toString(),
          latLng: positions[0],
        ));
        markers.add(Marker(
          markerId: UniqueKey().toString(),
          latLng: positions[1],
        ));
        markers.add(Marker(
          markerId: UniqueKey().toString(),
          latLng: positions[2],
        ));
        setState(() {});
      }),
      center: LatLng(centerLat, centerLng),
      markers: markers.toList(),
    );
  }
}
