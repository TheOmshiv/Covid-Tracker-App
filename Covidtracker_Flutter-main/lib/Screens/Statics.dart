import 'dart:convert';
import 'package:covidapp/Models/GlobalApi.dart';
import 'package:covidapp/Models/Cases.dart';
import 'package:covidapp/Models/Reuseable.dart';
import 'package:covidapp/Screens/CountryData.dart';
import 'package:covidapp/Screens/MoreInformation.dart';
import 'package:covidapp/Screens/WaitingState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
class Statics extends StatefulWidget {
  const Statics({Key? key}) : super(key: key);
  @override
  _StaticsState createState() => _StaticsState();
}
class _StaticsState extends State<Statics> with TickerProviderStateMixin {

  String tdata = DateFormat("dd-MMMM HH:mm a").format(DateTime.now());
  Future<Data> WorldStats() async {
    final response =
    await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Data(
          data['activePerOneMillion'],
          data['testsPerOneMillion'],
          data['criticalPerOneMillion'],
          data['recoveredPerOneMillion'],
          data['deathsPerOneMillion'],
          data['casesPerOneMillion'],
          data['tests'],
          data['affectedCountries'],
          data['critical'],
          data['active'],
          data['cases'],
          data['recovered'],
          data['deaths'],
          data['todayCases'],
          data['todayDeaths'],
          data['todayRecovered']);
    }
    return Data(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
       onRefresh: ()=>WorldStats(),
        color: Color(0xff961fea),
        child: FutureBuilder(
          future: WorldStats(),
          builder: (context, AsyncSnapshot<Data> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        ClipPaths('Global Statics'),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: 180,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: PieChart(
                              dataMap: {
                                "Total": snapshot.data!.cases.toDouble(),
                                "Recovered": snapshot.data!.recovered.toDouble(),
                                "Deaths": snapshot.data!.deaths.toDouble(),
                              },
                              colorList: [
                                Color(0xff961fea),
                                Color(0xff289234),
                                Color(0xffff3c3c),
                              ],
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.7,
                              chartType: ChartType.ring,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                              animationDuration: Duration(seconds: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Color(0xffd7b2f5),
                              Color(0xffd99be2),
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image(
                                    image:
                                        AssetImage('lib/Images/VioletVirus.png'),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff59058d),
                                        ),
                                      ),
                                      Text(
                                        'Infected Globally',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff59058d),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(snapshot.data!.cases.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Color(0xff59058d)
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Cases(snapshot.data!.recovered, 'lib/Images/GreenVirus.png' , 0xff9df1ac, 0xff96e29c,0xff24660f,'Recovered',MediaQuery.of(context).size.width*0.43),
                            Cases(snapshot.data!.deaths, 'lib/Images/RedVirus.png' , 0xfffc8e8e, 0xfff59d9d,0xffd40f0f,'Deaths',MediaQuery.of(context).size.width*0.43),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>MoreInfo()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'More Information',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff59058d),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Icon(
                                    Icons.arrow_right_sharp,
                                    size: 30,
                                    color:Color(0xff59058d) ,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 18, top: 40),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Daily Updates',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                              Text('Last updated on ${tdata}')
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * 0.95,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TodayCases('lib/Images/VioletLine.png', snapshot.data!.todayCases.toString(), 'Cases',0xff7900c4),
                              TodayCases('lib/Images/GreenLine.png',  snapshot.data!.todayRecovered.toString(), 'Recovered',0xff289234),
                              TodayCases('lib/Images/Death.png', snapshot.data!.todayDeaths.toString(), 'Deaths',0xffff3c3c),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryData()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            height: 75,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.purple),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.black,
                              highlightColor: Colors.purple,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('lib/Images/WorldMap.png'),
                                    width: 100,
                                    height: 60,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  Text(
                                    'Countrywise Statics',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            children: [
                              Text(
                                'WorldView of',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                              Text(
                                ' Covid-19',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.purple,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage('lib/Images/WorldMap.png'),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return WaitingState(context);
            }
            else return NetworkError(context,1);
          },
        ),
      ),
      backgroundColor: Color(0xFFFAF7F7),
    );
  }
}
