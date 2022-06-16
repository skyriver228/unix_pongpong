import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';
import 'dart:math' as math;

import 'package:client/pages/home_page.dart';




class SelectKeywordPage extends StatelessWidget {
  const SelectKeywordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(28, 28, 36, 1),
        centerTitle: true,
        leadingWidth: 150,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(const HomePage());
          },
          child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Center(
                  child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/b8c8/abba/78cac0eb16b91fbc80c193c33d478bc6?Expires=1655683200&Signature=PDzhYB8q5I4N98Ri6xNOhB6rgcoXCAN32JSYdsQjM4HeCMucd5Z58BG1Gfh8aULAzgkk8P4mXeCEWV4eZF5XBLHTs2-D~2GJHXvAJV8cctInRyQIlfuqB5HVup-cy6zyQ4IjwB8RuiwIkeBQDBITGf34Vbj2EwICrOhqt8RWgcglsomYQNJDIMEYHUJAexGc6TU3uNG5CTpBrZnXBBktkNpm0zwc7fnACqeJgXJ7GVOgOuQGJVTTEAenvJNQMkjkKX0iqk64Ml0NDX9c0LKOXbA1Ca2q304Ayh7imlkiPPaTOAVxCMdh~m6TjBTGjDbVqXaTmlY14SGg6tE39AfyGA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width))),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  Get.offAll(const HomePage());
                },
                child: const Text('URL')),
            Container(width: 25),
            InkWell(onTap: () {
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor: Color.fromRGBO(36, 39, 49, 1),
                  title:  Text("Coming Soon", style: TextStyle(color: Colors.white),),
                  content: Text("Annalysising PDF File", style: TextStyle(color: Colors.white)),
                );
              });

            }, child: const Text('PDF'))
          ],
        ),
        actions: [
          InkWell(
              onTap: () {
                Get.toNamed('/login-page1');
              },
              child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/a47e/9e85/ae926760f4b87dbe7ac58e3ddcaf0e89?Expires=1655683200&Signature=U~7e2NP8Gu5Hmsxuis9ffjlTueppaiOgGT-EempaLORpon1YayZdyaXFbsyN18KIPQkftdIzczHLgSdHmI3p1VzFte~hEoitm9mSRHDU3WvI~xp8hkLKD54tNmoXgKyHXzVcnSz7LtuyDNEumZMvwRDee1PSo1A4hUmYLn9u6Nl~FLoLRTxoUxXkE~JASa3bmIBfvB6tLih9OK1nu0~4VCNjkS-pkfBXHVIa-b991~QEVQA~tqVAM-ffd6TjhojbvI7cSwwvas4Mev8Hk0oufTFO46nwrgfK8hp0ErTt0hw7eoqZRwem0T20SCK7O7yG2Otk6TN-FTe9fYigLRa2jw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'))
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color.fromRGBO(36, 39, 49, 1),
                child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: _Timeline1()),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                  color: const Color.fromRGBO(36, 39, 49, 1),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, top: 100, bottom: 300),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                      'https://s3-alpha-sig.figma.com/img/1830/ae4a/c2323737a21a1610947dbaf34c2cfba2?Expires=1656288000&Signature=CWAVvE1yyZ1n6~C-SdrpfziQT~WzPne1hTPwnZIO3YwxWe-OOd1VzRv3HgRpQKIYcKio32RQSVPMDqWp4LMvD~7FG7JBJSM~pB3j~3eiWPm6tG4XKUZNlai7wUu3wFWvZ9h7QIpWY4VgLMXK2rNo9Badz-2qKrslvsr5F-0XdvTFPZKdWSwtHprusnYQVNKJ0aXmPftnStXtlnG4C1aCwsqFruqJkKgzxaVP12eiGxl07Ubqu3yXYm4~7cNjr07heW~n4eDDKQJDaJEMbqk0Vv0RWPm7OWEvR9jX11PUHQNVkZ-nq~12M5YGLHuddoWubVD0LxO-xokyUOu6wytG9Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),

                                  const SizedBox(width: 20),
                                  const Text('Select Keywords',
                                      style: TextStyle(
                                          fontSize: 36.0, color: Colors.white)),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Image.network(
                                        'https://s3-alpha-sig.figma.com/img/b080/c59b/2fb3b4144fb8b56686b7a7fd38ff646f?Expires=1656288000&Signature=Pd23B5ObhGew-aYp5-p8B12B2VLcOAqAHWhDO09EPQdxQWcfPrEEjRbkeOvfJqBOzlxgcIrJGOs5QodjFObZk7rJM4zWxJfnH5T0kUxZIdCjQoBsFe2bEd1Ha-hC5iJRY1q2orFY54iOZRUM72OTXaeLNR1iiJILXeJRMvnTpyPQGJYnnLUQLiGMolWkNEZ7YViLm1LRPW4nw0JRvvd7y7MKdGLSAgH7D-wKf1QYyQrgz648IfGnRhbUfgJB57OBWduA7xdk6eJXFpHVJ-NTWIIW5M8XRQ3WJuxnQpPz0zNdMqi2C9FmKxKBxkDKEEEX4Cx8YXfvtqWX4YATt~bm9w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                    onTap: () {
                                      Get.offAll(const HomePage());

                                    },
                                  ),
                                  const SizedBox(width: 20),

                                  GestureDetector(
                                    child: Image.network(
                                        'https://s3-alpha-sig.figma.com/img/6c37/be72/8cb7385b773f4a6bf164be404141849b?Expires=1656288000&Signature=fpBREIctpnBtE6FbgLjU8RFt0OAsvklSSlgFaIZfTSEExv0aKPi46pVooMH2hNGpjbde73YO6H5~Ed-ml3E-oH7RmLb7CUrqKzCg-AYM4zM0Z6hOPwb3zNWoVr~SryqYiVEYvSHzxOyYXk0LYd5uqUD2eraJwdQLfrkN8wCGJ6xyzFfSrq-Vev2YyzH8WkG89AYlX6rUChoI59GEJIKHC3kr8KV9Z~f5TidBHCKftCPRB2bTob91~7Cr1xQ4qWay97hnnGCFxQy74wG0FOkSmnACI~GOCHURZS-dG3IRO7IqDcqZhGE3tEzfHeg2fet7Sp1GLDFsD2rGPJPN9Ucq2Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                    onTap: () {
                                      Get.toNamed('/analysis-page');
                                    },

                                  ),
                                  const SizedBox(width: 20),

                                ],
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   child: const LineChartSample4(),
                        // )
                      ])),
            )
          ],
        ),
      ),
    );
  }
}

class LineChartSample4 extends StatelessWidget {
  const LineChartSample4({Key? key}) : super(key: key);

  static const _dateTextStyle = TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;

    return Transform.rotate(
      angle: 90 * math.pi / 180,
      child: AspectRatio(
        aspectRatio: 2.4,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 24),
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 4),
                    FlSpot(1, 3.5),
                    FlSpot(2, 4.5),
                    FlSpot(3, 1),
                    FlSpot(4, 4),
                    FlSpot(5, 6),
                    FlSpot(6, 6.5),
                    FlSpot(7, 6),
                    FlSpot(8, 4),
                    FlSpot(9, 6),
                    FlSpot(10, 6),
                    FlSpot(11, 7),
                  ],
                  isCurved: true,
                  barWidth: 8,
                  color: Colors.purpleAccent,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.deepPurple.withOpacity(0.4),
                    cutOffY: cutOffYValue,
                    applyCutOffY: true,
                  ),
                  aboveBarData: BarAreaData(
                    show: true,
                    color: Colors.orange.withOpacity(0.6),
                    cutOffY: cutOffYValue,
                    applyCutOffY: true,
                  ),
                  dotData: FlDotData(
                    show: false,
                  ),
                ),
              ],
              minY: 0,
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 1,
                checkToShowHorizontalLine: (double value) {
                  return value == 1 || value == 6 || value == 4 || value == 5;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}


enum _TimelineStatus {
  inputLink,
  selectKeyword,
  analysis
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.analysis;
}

class _Timeline1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = _TimelineStatus.values;
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: ConnectorThemeData(
            thickness: 4.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: IndicatorThemeData(
            size: 40.0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            if(index == 0){
              return Center(child: Text('Input url link', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)));

            } else if(index == 1) {
              return Center(child: Text('select keywords', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)));
            } else{
              return Center(child: Text('analysis',  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)));
            }
          },
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return DashedLineConnector(color: Color.fromRGBO(152, 142, 207, 1),
              );
            } else {
              return DashedLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.inputLink:
                return DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(child: Text('1',  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)))
                );
              case _TimelineStatus.selectKeyword:
                return DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(child: Text('2', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)))
                );
              case _TimelineStatus.analysis:
                return DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(child: Text('3',  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)))
                );
            }
          },
          itemExtentBuilder: (_, __) => kTileHeight,
          itemCount: data.length,

        ),
      ),
    );
  }
}

const kTileHeight = 100.0;