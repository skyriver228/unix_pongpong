import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:timelines/timelines.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

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
                      margin: EdgeInsets.only(left: 30, top: 100, bottom: 300),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://s3-alpha-sig.figma.com/img/145b/c5ce/f866d893d9962f9710e6814087275930?Expires=1655683200&Signature=Li61LIKplDYsNWH1d1TNo71G2-n-581XwLA9WL8~JQ9YXOzyf7jY8AazTFWyjJa5NgHrLbTLAQDPOC5-iNHDsfGnMf4AaFC0MnP2jiWmConKOg0PiniwjXUPPCLneM697utEy-rlzhiv6JNW5TVybbcIkG-Ryl4WFRKxo18NPTcCpHX684PfI~xgRsUg0CVd84hOJXbtYD1fp0s0LPDIDEKu5a29oJzM7bTfogCzCKlGToca-IrqY-C2RfhwsVNZnQuB3-ZE~uf7wE7OaUHH428mokyFotWozVNrQBfZEd8o3JFB6G-czap-0wFvuTfc0fJAhICb4Idn-S5o-S8WnQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                          const Text('Input url for annalysis', style: TextStyle(fontSize: 36.0, color: Colors.white)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 800,
                          height: 40,
                          child: TextField(
                            controller: c.urlController,
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                prefixIcon: Image.network(
                                    'https://s3-alpha-sig.figma.com/img/862a/978f/e8862e8ba14275ceafb493e7ec00aa61?Expires=1655683200&Signature=c~-03z3VsMLk78P0cY3tmslVc1fhrcgjS1kJ7GtBkKeSfZnu~AMYgxhpz7cPC50tUU6T1yhL-EsQS~DuADcesZSfQiL75PNeh4eXnrmQLq1CEStFyEsL8a-Pj7TLYhu3-NMxefHZLUYEojD~0w9903rn9idFZuHdoqO171~~qIvzm49STmahpAlW7sS2UMwqZYtJD531y-WtzBwmNMK8l3xsTv4066tvgvV8x~2UJRjy9a4hgRt3Upp1P7UbXnOQ7n0e67H5uDalH882rt-EdbDVvL7OYwoPv3cOlGhmvf9oRuN6hvQPLg5R1uf2jnoJ008yL0RoPL0aNt2LSZeVRg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                hintText: "Input link here",
                                suffixIcon: SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: InkWell(
                                    onTap: () {
                                      c.submit();
                                    },
                                    child: Image.network(
                                        'https://s3-alpha-sig.figma.com/img/97be/86ea/0d749f1a9b9f08a43ba6d0ef55e600a0?Expires=1655683200&Signature=U6ti-AlDCJi2709Fe3tm5WSh-fOQEriFxmqIjteyYjGF2QJTYu-c9aLspi7r2TJ1ul~8GR0C6Y2BVIdtC3n14bcq0AOd21CIqBIOiVGSLN8l7RqKH8o68pK1DPztp~ROwp4yllwTC2EzAhsTIygPdmPYDv1Hx5Ovp14Y6FOne7S02d4jmkn6iu0IKYxerMog5iWkcUkck~EylfW-aFolgAdbG4zYtpLN16jWPar2JQD4bjqNS7XhHAOo9G~EZCcdmoPHbcqyhOYt5OF4nc1gBj9-Kd6Vb6HiGwz~Rkuyfa0LpFZoU77ZgIBh3yFJ9AtFPUhsFlD8jDCJQ6~0QUg9Vw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                  ),
                                ),
                                hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
                                filled: true,
                                fillColor: const Color.fromRGBO(36, 39, 49, 0.7),
                                hoverColor: const Color.fromRGBO(36, 39, 49, 0.7),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                          ),
                        )
                      ],
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

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: Color(0xffe6e7e9),
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


class HomeController extends GetxController {
  final urlController = TextEditingController();

  @override
  void onInit() {
    urlController.text = '';
    super.onInit();
  }

  submit() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://15.165.39.55/api/v3/appVersion.php'));
    request.body = json.encode({
      "url": urlController.text
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }
}

// class _Timeline2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<_TimelineStatus> data = [
//       _TimelineStatus.inputLink,
//       _TimelineStatus.selectKeyword,
//       _TimelineStatus.analysis
//     ];
//
//     return Flexible(
//       child: Timeline.tileBuilder(
//         theme: TimelineThemeData(
//           nodePosition: 0,
//           color: Color(0xffc2c5c9),
//           connectorTheme: ConnectorThemeData(
//             thickness: 3.0,
//           ),
//         ),
//         padding: EdgeInsets.only(top: 20.0),
//         builder: TimelineTileBuilder.connected(
//           indicatorBuilder: (context, index) {
//             return DotIndicator(
//               color: data[index].isInProgress ? Color(0xff193fcc) : null,
//             );
//           },
//           connectorBuilder: (_, index, connectorType) {
//             var color;
//             if (index + 1 < data.length - 1) {
//               color = data[index].isInProgress && data[index + 1].isInProgress
//                   ? Color(0xff193fcc)
//                   : null;
//             }
//             return SolidLineConnector(
//               indent: connectorType == ConnectorType.start ? 0 : 2.0,
//               endIndent: connectorType == ConnectorType.end ? 0 : 2.0,
//               color: color,
//             );
//           },
//           contentsBuilder: (_, __) => _EmptyContents(),
//           itemExtentBuilder: (_, __) {
//             return kTileHeight;
//           },
//           itemCount: data.length,
//         ),
//       ),
//     );
//   }
// }

// class _Timeline3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<_TimelineStatus> data = [
//       _TimelineStatus.inputLink,
//       _TimelineStatus.selectKeyword,
//       _TimelineStatus.analysis
//     ];
//
//     return Flexible(
//       child: Timeline.tileBuilder(
//         theme: TimelineThemeData(
//           nodePosition: 0,
//           nodeItemOverlap: true,
//           connectorTheme: ConnectorThemeData(
//             color: Color(0xffe6e7e9),
//             thickness: 15.0,
//           ),
//         ),
//         padding: EdgeInsets.only(top: 20.0),
//         builder: TimelineTileBuilder.connected(
//           indicatorBuilder: (context, index) {
//             final status = data[index];
//             return OutlinedDotIndicator(
//               color:
//               status.isInProgress ? Color(0xff6ad192) : Color(0xffe6e7e9),
//               backgroundColor:
//               status.isInProgress ? Color(0xffd4f5d6) : Color(0xffc2c5c9),
//               borderWidth: status.isInProgress ? 3.0 : 2.5,
//             );
//           },
//           connectorBuilder: (context, index, connectorType) {
//             var color;
//             if (index + 1 < data.length - 1 &&
//                 data[index].isInProgress &&
//                 data[index + 1].isInProgress) {
//               color = data[index].isInProgress ? Color(0xff6ad192) : null;
//             }
//             return SolidLineConnector(
//               color: color,
//             );
//           },
//           contentsBuilder: (context, index) {
//             var height;
//             if (index + 1 < data.length - 1 &&
//                 data[index].isInProgress &&
//                 data[index + 1].isInProgress) {
//               height = kTileHeight - 10;
//             } else {
//               height = kTileHeight + 5;
//             }
//             return SizedBox(
//               height: height,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: _EmptyContents(),
//               ),
//             );
//           },
//           itemCount: data.length,
//         ),
//       ),
//     );
//   }
// }
