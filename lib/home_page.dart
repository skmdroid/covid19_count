import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'cases_view.dart';
import 'district.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: http.get(
              Uri.https("api.covid19india.org", "state_district_wise.json")),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error while loading data"),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var response = json.decode(snapshot.data.body);
              District district = District.fromJson(response);
              return Column(
                children: [
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Covid Count - Udupi',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.edit_location_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Active Cases',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              child: Divider(
                                color: Colors.grey,
                              ),
                              width: 150.0,
                            ),
                            Text(
                                "${district.totalActiveCases} active of ${district.totalConfirmedCases} cases("
                                "${((district.totalActiveCases / district.totalConfirmedCases) * 100).round()}%)"),
                            SizedBox(
                              height: 10.0,
                            ),
                            LinearProgressIndicator(
                              value: (district.totalActiveCases /
                                  district.totalConfirmedCases),
                              semanticsLabel: 'Active Cases',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Cases',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              child: Divider(
                                color: Colors.black,
                              ),
                              width: 150.0,
                            ),
                            CasesView(
                              Colors.orange,
                              "Confirmed",
                              "${district.totalConfirmedCases}",
                            ),
                            CasesView(
                              Colors.yellow,
                              "Active",
                              "${district.totalActiveCases}",
                            ),
                            CasesView(
                              Colors.green[300],
                              "Recovered",
                              "${district.totalRecoveredCases}",
                            ),
                            CasesView(
                              Colors.red,
                              "Deceased",
                              "${district.totalDeceasedCases}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today Cases',
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              child: Divider(
                                color: Colors.black,
                              ),
                              width: 150.0,
                            ),
                            CasesView(
                              Colors.orange,
                              "Confirmed",
                              "${district.todayConfirmedCases}",
                            ),
                            CasesView(
                              Colors.green[300],
                              "Recovered",
                              "${district.todayRecoveredCases}",
                            ),
                            CasesView(
                              Colors.red,
                              "Deceased",
                              "${district.todayDeceasedCases}",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
