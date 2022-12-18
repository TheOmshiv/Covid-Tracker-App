import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'HomePage.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  State<FirstPage> createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  late final AnimationController _controller=AnimationController(
    duration: Duration(seconds: 7),
      vsync: this
  )..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color(0xFF6D00D7),
            Color(0xFFAD00F5),
          ],
        )
      ),
      child: Scaffold(
        body:Column(
          children: [
            SafeArea(
              child: Center(
                child: Image(
                  image:AssetImage("lib/Images/logo.png"),
                ),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0,top: 10),
                    child: Image(
                      image: AssetImage('lib/Images/person.png'),
                      height: MediaQuery.of(context).size.height*0.3,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Image(
                      image: AssetImage('lib/Images/CoronaVirus_Background.png'),
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.height*0.4,
                  ),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _controller,
              child:Container(
                margin: EdgeInsets.only(top: 20),
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:AssetImage("lib/Images/CoronaVirus.png"),
                  )
                ),
              ),
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value*2.0 *math.pi,
                  child: child,
                );
              }
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Covid-19\nTracker App",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Made by Praveen Kumar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
