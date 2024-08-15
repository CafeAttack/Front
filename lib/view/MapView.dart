import 'package:cafe_attack/view/floatingButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapPage extends StatelessWidget {
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
              ), //모서리
              onPressed: () {},
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
              // onMapCreated: (controller) {
              //   // Handle map creation
              // },

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

class FilterButton extends StatelessWidget {
  final String label;

  FilterButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your filter logic here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
