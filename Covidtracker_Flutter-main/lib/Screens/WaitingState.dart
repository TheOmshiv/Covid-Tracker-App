import 'dart:convert';
import 'package:covidapp/Models/Reuseable.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
Widget WaitingState(BuildContext context){
  return SingleChildScrollView(
    child: Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          children: [
            ClipPaths('Global Statics'),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.03,
              top: 200,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.93,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(80),
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                ThreeShimmer(),
                                ThreeShimmer(),
                                ThreeShimmer(),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50,),
        DownShimmers(MediaQuery.of(context).size.width * 0.93,  MediaQuery.of(context).size.width * 0.03),
        DownShimmers(MediaQuery.of(context).size.width * 0.93,  MediaQuery.of(context).size.width * 0.03),
        DownShimmers(MediaQuery.of(context).size.width * 0.93,  MediaQuery.of(context).size.width * 0.03),
      ],
    ),
  );
}