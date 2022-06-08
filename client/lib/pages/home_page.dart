import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            InkWell(onTap: () {}, child: const Text('PDF'))
          ],
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/a47e/9e85/ae926760f4b87dbe7ac58e3ddcaf0e89?Expires=1655683200&Signature=U~7e2NP8Gu5Hmsxuis9ffjlTueppaiOgGT-EempaLORpon1YayZdyaXFbsyN18KIPQkftdIzczHLgSdHmI3p1VzFte~hEoitm9mSRHDU3WvI~xp8hkLKD54tNmoXgKyHXzVcnSz7LtuyDNEumZMvwRDee1PSo1A4hUmYLn9u6Nl~FLoLRTxoUxXkE~JASa3bmIBfvB6tLih9OK1nu0~4VCNjkS-pkfBXHVIa-b991~QEVQA~tqVAM-ffd6TjhojbvI7cSwwvas4Mev8Hk0oufTFO46nwrgfK8hp0ErTt0hw7eoqZRwem0T20SCK7O7yG2Otk6TN-FTe9fYigLRa2jw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'))
        ],
      ),
      body: Container(
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromRGBO(36, 39, 49, 1),
                  child: const Center(
                    child: Text('Flex 1', style: TextStyle(fontSize: 36.0, color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    color: const Color.fromRGBO(36, 39, 49, 1),
                    child: Column(children: [
                      Row(
                        children: [
                          Image.network(
                              'https://s3-alpha-sig.figma.com/img/145b/c5ce/f866d893d9962f9710e6814087275930?Expires=1655683200&Signature=Li61LIKplDYsNWH1d1TNo71G2-n-581XwLA9WL8~JQ9YXOzyf7jY8AazTFWyjJa5NgHrLbTLAQDPOC5-iNHDsfGnMf4AaFC0MnP2jiWmConKOg0PiniwjXUPPCLneM697utEy-rlzhiv6JNW5TVybbcIkG-Ryl4WFRKxo18NPTcCpHX684PfI~xgRsUg0CVd84hOJXbtYD1fp0s0LPDIDEKu5a29oJzM7bTfogCzCKlGToca-IrqY-C2RfhwsVNZnQuB3-ZE~uf7wE7OaUHH428mokyFotWozVNrQBfZEd8o3JFB6G-czap-0wFvuTfc0fJAhICb4Idn-S5o-S8WnQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                          const Text('Input url for annalysis', style: TextStyle(fontSize: 36.0, color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
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
                                      onTap: () {},
                                      child: Image.network(
                                          'https://s3-alpha-sig.figma.com/img/97be/86ea/0d749f1a9b9f08a43ba6d0ef55e600a0?Expires=1655683200&Signature=U6ti-AlDCJi2709Fe3tm5WSh-fOQEriFxmqIjteyYjGF2QJTYu-c9aLspi7r2TJ1ul~8GR0C6Y2BVIdtC3n14bcq0AOd21CIqBIOiVGSLN8l7RqKH8o68pK1DPztp~ROwp4yllwTC2EzAhsTIygPdmPYDv1Hx5Ovp14Y6FOne7S02d4jmkn6iu0IKYxerMog5iWkcUkck~EylfW-aFolgAdbG4zYtpLN16jWPar2JQD4bjqNS7XhHAOo9G~EZCcdmoPHbcqyhOYt5OF4nc1gBj9-Kd6Vb6HiGwz~Rkuyfa0LpFZoU77ZgIBh3yFJ9AtFPUhsFlD8jDCJQ6~0QUg9Vw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                    ),
                                  ),
                                  hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
                                  filled: true,
                                  fillColor: const Color.fromRGBO(36, 39, 49, 0.7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: const LineChartSample4(),
                      )
                    ])),
              )
            ],
          ),
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
