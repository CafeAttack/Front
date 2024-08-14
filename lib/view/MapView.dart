import 'package:cafe_attack/view/floatingButton.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: LabelChange(),
      body: Stack(
        children: [
          KakaoMap(
            // onMapCreated: (controller) {
            //   // Handle map creation
            // },

          ),

          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child:
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu),iconSize: 40,),
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
                          )
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.search),iconSize: 40,)
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