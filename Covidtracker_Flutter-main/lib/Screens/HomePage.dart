import 'package:covidapp/Models/Clipper.dart';
import 'package:covidapp/Models/Sympotms.dart';
import 'package:covidapp/Screens/Statics.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity ,
                height: 350,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors:[
                          Color(0xFF6D00D7),
                          Color(0xFFAD00F5),
                        ]
                    ),
                    image: DecorationImage(
                        image:AssetImage('lib/Images/virus.png')
                    )
                ),
                child: SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image(
                          image: AssetImage('lib/Images/Doctor.png'),
                          width: 120,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70,left: 20),
                        child: Text(
                          'All you need\n\nis Stay at Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:FontWeight.bold,
                            fontSize: 20,
                            wordSpacing: 1,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text('Symptomes of ',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),),
                  Text(' Covid 19', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF7A0BF6),
                  ))
                ],
              )
            ),

            SizedBox(height: 30,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 Sympotms('lib/Images/Fever.png', 'Fever',5),
                 Sympotms('lib/Images/Cough.png','Cough',25),
                 Sympotms('lib/Images/Headache.png','Headache',25),
                 Sympotms('lib/Images/Weakness.png','Weakness',25),
                 Sympotms('lib/Images/Rhintis.png','Rhinitis',25),
                ],
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text(
                "Preventaion",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,),
                textAlign: TextAlign.start,
              ),
            ),

            SizedBox(height: 30),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                 Preventation('lib/Images/HandWash.png', "Wash", 'Always wash hand\n   using Sanatizer'),
                 Preventation('lib/Images/Mask.png', "Mask", 'Always wear \n      mask'),
                 Preventation('lib/Images/Home.png', "Home", 'Stay Home and\n      stay safe'),
                 Preventation('lib/Images/Distance.png', "keep Distance", 'From Others'),
                 Preventation('lib/Images/Touch.png', "Touch", "Don't Touch Mouth \n and  Nose regularly"),
                 Preventation('lib/Images/News.png', "Updated", "Stay Updated"),
                ],
              ),
            ),

            SizedBox(height: 30,),
            Shimmer.fromColors(
              baseColor: Colors.black,
              highlightColor: Colors.purple.shade500,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Statics()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: AssetImage('lib/Images/WorldMap.png'),
                        width: 120,
                        height: 60,
                      ),
                      Column(
                        children: [
                          Text("Cases"),
                          Text("Worldwide Overview")
                        ],
                      ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
