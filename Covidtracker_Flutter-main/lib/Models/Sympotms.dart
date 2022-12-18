import 'package:flutter/material.dart';
Widget Sympotms( String image, String disease,double left){
  return  Column(
    children: [
      Container(
        margin: EdgeInsets.only(left: left),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fitHeight,
            )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: Text(
          disease,
          style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ],
  );
}
Widget Preventation(String image,String Heading,String Info){
  return   Container(
    margin: EdgeInsets.only(left: 18),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: AssetImage(image),
          width: 80,
          height: 80,
        ),
        Column(
          children: [
            Text(Heading,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6700E2)
              ),
            ),
            Text(Info,style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        )
      ],
    ),
    width: 230,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(19),
    ),
  );
}
