import 'dart:convert';
import 'package:covidapp/Models/Reuseable.dart';
import 'package:covidapp/Screens/Country_Statics.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
class CountryData extends StatefulWidget {
  const CountryData({Key? key}) : super(key: key);
  @override
  _CountryDataState createState() => _CountryDataState();
}
class _CountryDataState extends State<CountryData> {
  TextEditingController searchController = TextEditingController();
  Widget ContainerShimmer(){
      return Column(
        children: [
          Container(
            width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),

                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,)
        ],
      );
  }
  Future<List<dynamic>> countriesListApi() async {
    var data ;
    final response = await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: ()=>countriesListApi(),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPaths('Country Statics'),
                  Positioned(
                     top: 190,
                    left: MediaQuery.of(context).size.width*0.1,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Country Name',
                        ),
                        onChanged: (value){
                          searchController.text=value;
                          searchController.selection=TextSelection.fromPosition(TextPosition(offset:searchController.text.length));
                          setState(() {});
                        },
                      ),
                    ),
                  )
                ],
              ),
              FutureBuilder(
                future: countriesListApi(),
                builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
                  if(snapshot.hasData){
                    return SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           physics: ScrollPhysics(),
                            itemCount:snapshot.data!.length,
                            itemBuilder: (context,index){
                            String name=snapshot.data![index]['country'];
                            if(searchController.text.isEmpty){
                              return Column(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.95,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      margin: EdgeInsets.zero,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Image(
                                              image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                                              errorBuilder: (context, error, trace) => Image.asset('lib/Images/images.png'),
                                              width: 60,
                                              height: 60,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              snapshot.data![index]['country'],
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryStatics(country: snapshot.data![index]['country'], cases:snapshot.data![index]['cases'], todayCases:snapshot.data![index]['todayCases'], todayDeaths:snapshot.data![index]['todayDeaths'], recovered:snapshot.data![index]['recovered'], todayRecovered:snapshot.data![index]['todayRecovered'], active:snapshot.data![index]['active'], critical:snapshot.data![index]['critical'], casesPerOneMillion:snapshot.data![index]['casesPerOneMillion'] , deathsPerOneMillion:snapshot.data![index]['deathsPerOneMillion'] , tests:snapshot.data![index]['tests'], testsPerOneMillion:snapshot.data![index]['testsPerOneMillion'] , population:snapshot.data![index]['population'] , oneCasePerPeople:snapshot.data![index]['oneCasePerPeople'] , oneDeathPerPeople:snapshot.data![index]['oneDeathPerPeople'], oneTestPerPeople:snapshot.data![index]['oneTestPerPeople'], activePerOneMillion:snapshot.data![index]['activePerOneMillion'] , recoveredPerOneMillion:snapshot.data![index]['recoveredPerOneMillion'] , criticalPerOneMillion:snapshot.data![index]['criticalPerOneMillion']  , deaths:snapshot.data![index]['deaths'])));
                                    },
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              );
                            }
                            else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                              return  Column(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryStatics(country: snapshot.data![index]['country'], cases:snapshot.data![index]['cases'], todayCases:snapshot.data![index]['todayCases'], todayDeaths:snapshot.data![index]['todayDeaths'], recovered:snapshot.data![index]['recovered'], todayRecovered:snapshot.data![index]['todayRecovered'], active:snapshot.data![index]['active'], critical:snapshot.data![index]['critical'], casesPerOneMillion:snapshot.data![index]['casesPerOneMillion'] , deathsPerOneMillion:snapshot.data![index]['deathsPerOneMillion'] , tests:snapshot.data![index]['tests'], testsPerOneMillion:snapshot.data![index]['testsPerOneMillion'] , population:snapshot.data![index]['population'] , oneCasePerPeople:snapshot.data![index]['oneCasePerPeople'] , oneDeathPerPeople:snapshot.data![index]['oneDeathPerPeople'], oneTestPerPeople:snapshot.data![index]['oneTestPerPeople'], activePerOneMillion:snapshot.data![index]['activePerOneMillion'] , recoveredPerOneMillion:snapshot.data![index]['recoveredPerOneMillion'] , criticalPerOneMillion:snapshot.data![index]['criticalPerOneMillion']  , deaths:snapshot.data![index]['deaths'])));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width*0.95,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                      ),
                                      margin: EdgeInsets.zero,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Image(
                                              image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                                              errorBuilder: (context, error, trace) => Image.asset('lib/Images/images.png'),
                                              width: 60,
                                              height: 60,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              snapshot.data![index]['country'],
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              );
                            }
                            else return Container();
                            },
                          ),

                    );
                  }
                  else if(snapshot.connectionState==ConnectionState.waiting){
                    return Column(
                      children: [
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                            ContainerShimmer(),
                      ],
                    );
                  }
                  else if(snapshot.hasError){
                    return NetworkError(context,2);
                  }
                  else{
                    print(snapshot.error);
                    return NetworkError(context,2);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfff1eeee),
    );
  }
}
