import 'package:flutter/material.dart';
Widget Cases(int cases, String image, int Color1, int Color2,int color3, String Name,double width){
   return Container(
     height: 150,
     width: width,
     decoration: BoxDecoration(
       gradient: LinearGradient(colors: [
         Color(Color1),
         Color(Color2),
       ]),
       color: Colors.white,
       borderRadius: BorderRadius.circular(15),
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Image(
           image:
           AssetImage(image),
           width: 50,
           height: 50,
         ),
         Text(
           cases.toString(),
           style: TextStyle(
               fontSize: 21,
               fontWeight: FontWeight.bold,
               color: Color(color3),
           ),
         ),
         Text(
           Name,
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w600,
               color: Color(color3)
           ),
         ),
       ],
     ),
   );
 }
 Widget TodayCases(String image,String Cases,String Name,int Colors){
   return Column(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       Image(
         image:
         AssetImage(image),
         width: 60,
         height: 60,
       ),
       Text(
         Cases,
         style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 21,
             color: Color(Colors)
         ),
       ),
       Text(Name,style: TextStyle(
           color: Color(Colors),
       ),)
     ],
   );
 }