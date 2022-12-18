import 'package:covidapp/Models/Clipper.dart';
import 'package:covidapp/Screens/CountryData.dart';
import 'package:covidapp/Screens/MoreInformation.dart';
import 'package:covidapp/Screens/Statics.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
Widget ClipPaths(String Name){
   return ClipPath(
     clipper:MyClipper(),
     child: Container(
       width: double.infinity,
       height: 350,
       decoration: BoxDecoration(
           gradient: LinearGradient(
               begin: Alignment.topRight,
               end: Alignment.bottomLeft,
               colors: [
                 Color(0xFFB87DEF),
                 Color(0xFFA356C7),
               ])),
       child: Padding(
         padding:
         const EdgeInsets.only(top: 100.0, left: 20),
         child: Text(
           Name,
           style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 30,
               color: Colors.white),
         ),
       ),
     ),
   );
}
Widget ThreeShimmer(){
  return Container(
    margin:
    EdgeInsets.only(top: 10),
    width: 100,
    height: 15,
    color: Colors.white,
  );
}
Widget DownShimmers(double width,double left){
  return Container(
    width: width,
    height: 100,
    margin: EdgeInsets.only(left: left,top: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment:
      MainAxisAlignment.spaceAround,
      children: [
        Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(40),
                  ),
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 220,
                      height: 30,
                      color: Colors.white,
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: 10),
                      width: 200,
                      height: 30,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            )),
      ],
    ),
  );
}
Widget NetworkError(BuildContext context,int which){
  return SafeArea(
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('lib/Images/NoInternet.png'),
              width: MediaQuery.of(context).size.width * 0.65,
              height: 250,
            ),
            SizedBox(height: 20,),
            Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Please Check Your Internet, and Refresh',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                if(which==1){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Statics()));
                }
                else if(which==2){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CountryData()));
                }
                else if(which==3){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MoreInfo()));
                }
              },
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple,width: 2),
                ),
                child: Center(
                  child: Text(
                    'Refresh',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
  );
}
Widget Containers(int color1,int color2,int color3,String Name1,double cases, BuildContext context){
  return Container(
    width: MediaQuery.of(context).size.width*0.45,
    height: 120,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
          colors: [
            Color(color1),
            Color(color2)
          ]
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0,top: 5),
            child: Text(
              Name1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color:Color(color3)
              ),
            ),
          ),
        ) ,
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0,right: 12),
            child: Text(
              cases.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color:Color(color3)
              ),
            ),
          ),
        )
      ],
    ),
  );
}
Widget Information(int color1,int color2,String name,String cases){
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
            colors: [
              Color(color1),
              Color(color2)
            ]
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
        ) ,
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            cases,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
  );
}