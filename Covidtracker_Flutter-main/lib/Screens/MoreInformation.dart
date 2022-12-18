import 'dart:convert';
import 'package:covidapp/Models/GlobalApi.dart';
import 'package:covidapp/Models/Reuseable.dart';
import 'package:covidapp/Screens/WaitingState.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
class MoreInfo extends StatefulWidget {
  const MoreInfo({Key? key}) : super(key: key);
  @override
  _MoreInfoState createState() => _MoreInfoState();
}
class _MoreInfoState extends State<MoreInfo> {

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
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: WorldStats(),
        builder: (context, AsyncSnapshot<Data> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              onRefresh: ()=>WorldStats(),
              child: SingleChildScrollView(
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
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.93,
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
                                Color(0xffaf0027),
                                Color(0xffceb70e),
                                Color(0xff921b1b),
                              ],
                              chartRadius:
                                  MediaQuery.of(context).size.width / 2.7,
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
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Other',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' information',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10,),
                        Containers(0xff84f59d, 0xff8fe087, 0xff289234, 'Active', snapshot.data!.active.toDouble(), context),
                        Containers(0xffbe9fe0, 0xffc4a2e7, 0xff961fea, 'Crtical', snapshot.data!.critical.toDouble(), context)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10,),
                        Containers(0xffa3ecf1, 0xffa6f5fa, 0xff00b2dc, 'Tests', snapshot.data!.tests.toDouble(), context),
                        Containers(0xffffb8c8, 0xfffa9fb2, 0xffaf0027, 'AffectedCountries', snapshot.data!.affectedCountries.toDouble(), context)
                      ],
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Statics per',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' million',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Column(
                        children: [
                          SizedBox(height: 5,),
                          Information(0xffb983e8, 0xffc277db, "CasesPerOneMillion", snapshot.data!.casesPerOneMillion.toString()),
                          Information(0xff81c690, 0xff84f59d, "RecoverPerOneMillion", snapshot.data!.recoveredPerOneMillion.toString()),
                          Information(0xffde8f8f, 0xffea7f7f, "DeathPerOneMillion", snapshot.data!.deathsPerOneMillion.toString()),
                          Information(0xffdecb85, 0xfffff7bf, "ActivePerOneMillion", snapshot.data!.activePerOneMillion.toString()),
                          Information(0xff84f3fa, 0xffa7e9ee, "TestsPerOneMillion", snapshot.data!.testsPerOneMillion.toString()),
                          Information(0xffbe9fe0, 0xffc4a2e7, "CriticalPerOneMillion", snapshot.data!.criticalPerOneMillion.toString()),
                        ]
                    ),
                  ],
                ),
              ),
            );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return WaitingState(context);
          }
          else return NetworkError(context,3);
        },
      )),
    );
  }
}
