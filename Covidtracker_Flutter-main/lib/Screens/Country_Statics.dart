import 'dart:core';
import 'package:covidapp/Models/Cases.dart';
import 'package:covidapp/Models/Reuseable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
class CountryStatics extends StatefulWidget {
  final String country;
  final int cases;
  final int deaths;
  final int todayCases;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;
  const CountryStatics({Key? key,  required this.country, required this.cases, required this.todayCases, required this.todayDeaths, required this.recovered, required this.todayRecovered, required this.active, required this.critical, required this.casesPerOneMillion, required this.deathsPerOneMillion, required this.tests, required this.testsPerOneMillion, required this.population, required this.oneCasePerPeople, required this.oneDeathPerPeople, required this.oneTestPerPeople, required this.activePerOneMillion, required this.recoveredPerOneMillion, required this.criticalPerOneMillion, required this.deaths} ) : super(key: key);
  @override
  _CountryStaticsState createState() => _CountryStaticsState();
}
class _CountryStaticsState extends State<CountryStatics> {
  String tdata = DateFormat("dd-MMMM HH:mm a").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                ClipPaths(widget.country),
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
                        "Total": widget.cases.toDouble(),
                        "Recovered": widget.recovered.toDouble(),
                        "Deaths": widget.deaths.toDouble(),
                      },
                      colorList: [
                        Color(0xff961fea),
                        Color(0xff289234),
                        Color(0xfffa0000),
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
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 18, top: 40),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
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
                  TodayCases('lib/Images/VioletLine.png', widget.todayCases.toString(), 'Cases',0xff7900c4),
                  TodayCases('lib/Images/GreenLine.png', widget.todayRecovered.toString(), 'Recovered',0xff289234),
                  TodayCases('lib/Images/Death.png', widget.todayDeaths.toString(),'Deaths',0xffff3c3c),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Containers(0xffe5ccf6, 0xffd7b2ef, 0xff961fea, 'Total Cases', widget.cases.toDouble(),context),
                Containers(0xffc9fdd0, 0xffb9f3c1, 0xff289234, 'Total Recovered', widget.recovered.toDouble(),context)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Containers(0xfffdb8b8, 0xffef9d9d, 0xffff3c3c, 'Total Deaths', widget.deaths.toDouble(),context),
                Containers(0xffefdba4, 0xffece1a4, 0xffc99c0e, 'Active', widget.active.toDouble(),context)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,top: 25),
              child: Text(
                'Per million statics',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
            ),
            Information(0xffe5ccf6, 0xffd7b2ef, 'CasesPerOneMillion', widget.casesPerOneMillion.toString()),
            Information(0xffc9fdd0, 0xffb9f3c1, 'RecoverPerOneMillion',widget.recoveredPerOneMillion.toString()),
            Information(0xfffdb8b8, 0xffef9d9d, 'DeathPerOneMillion', widget.deathsPerOneMillion.toString()),
            Information(0xfffdb2b1, 0xffef3d9e, 'CriticalOnePerMillion', widget.criticalPerOneMillion.toString()),
            Information(0xff99cbef, 0xff95c9f1, 'TestPerOneMillion', widget.testsPerOneMillion.toString()),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,top: 20),
              child: Text(
                'Other Data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
            Information(0xffe5ccf6, 0xffd7b2ef, 'Tests', widget.tests.toString()),
            Information(0xfffdb8b8, 0xffef9d9d, 'Critical', widget.critical.toString()),
            Information(0xffc9fdd0, 0xffb9f3c1, 'OneTestPerPeople',widget.oneTestPerPeople.toString()),
            Information(0xfffdb2b1, 0xffef3d9e, 'OneCasePerPeople', widget.oneCasePerPeople.toString()),
            Information(0xff99cbef, 0xff95c9f1, 'oneDeathPerPeople', widget.oneDeathPerPeople.toString()),
            Information(0xffa1ac49, 0xff95c9f1, 'population', widget.population.toString()),
          ],
        ),
      ),
    );
  }
}
