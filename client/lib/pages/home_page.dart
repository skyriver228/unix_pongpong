import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

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
            InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          backgroundColor: Color.fromRGBO(36, 39, 49, 1),
                          title: Text(
                            "Coming Soon",
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Text("Annalysising PDF File",
                              style: TextStyle(color: Colors.white)),
                        );
                      });
                },
                child: const Text('PDF'))
          ],
        ),
        actions: [
          InkWell(
              onTap: () => _launchUrl(),
              child: Image.network(
                  'https://s3-alpha-sig.figma.com/img/c4d2/32cd/372d21346309e1c89a7fda2c2dbf2930?Expires=1656288000&Signature=OSkfumZiJWQKDevC598E7sCcQnkiBP9uDYt3wpx8B35TraUlDjIw0~IzKnuKFl2~8kP14sfaNrGxPvCNU9aa1UnoesIOIJ3u0ROqrS~o9sFdSMgEBoodnd9HfpFVElDL-ML9j3P0FIYbJbeFEBcmhgtwzO2tK4Pj0ViRy8JFZfm2MXHItNlwVo4Urcn4ybq8zRyFlurz5tM8Q0m2~Jg~XIoOc-v1QOzVj6vnZsrTfd5pRlNEa5UroCgFuPYj4S2oi6xbzgpzekkOq44Yg-3TMoNh0s-zS3V1pD89csdxy~2Vt8XUWBPMnc6Jfy0jdtsuui-1tQATQNTbk-6gdzjvDw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'))
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
                            children: [
                              Image.network(
                                  'https://s3-alpha-sig.figma.com/img/145b/c5ce/f866d893d9962f9710e6814087275930?Expires=1655683200&Signature=Li61LIKplDYsNWH1d1TNo71G2-n-581XwLA9WL8~JQ9YXOzyf7jY8AazTFWyjJa5NgHrLbTLAQDPOC5-iNHDsfGnMf4AaFC0MnP2jiWmConKOg0PiniwjXUPPCLneM697utEy-rlzhiv6JNW5TVybbcIkG-Ryl4WFRKxo18NPTcCpHX684PfI~xgRsUg0CVd84hOJXbtYD1fp0s0LPDIDEKu5a29oJzM7bTfogCzCKlGToca-IrqY-C2RfhwsVNZnQuB3-ZE~uf7wE7OaUHH428mokyFotWozVNrQBfZEd8o3JFB6G-czap-0wFvuTfc0fJAhICb4Idn-S5o-S8WnQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                              const Text('Input url for annalysis',
                                  style: TextStyle(
                                      fontSize: 36.0, color: Colors.white)),
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
                                    hintStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(36, 39, 49, 0.7),
                                    hoverColor:
                                        const Color.fromRGBO(36, 39, 49, 0.7),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none,
                                    )),
                              ),
                            )
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: Image.network(
                                'https://s3-alpha-sig.figma.com/img/db34/a5f9/d826de7261e27619153b1af1859c7dba?Expires=1656288000&Signature=Qd3ZtS1RB7p3Oi5dum52cbzmLwmYwvuLNkoFm~XitEQZUpAn4Y9cYhlr2t5soiZHKFvkIGuswrA6eg9pSKdfApstDnui2rRuNlq9oJpl3g1pfbn6LRaaSrU6XSph1~o9UfDxENyVmS2jaQ06NpMQ4MP2JqwXYWx6aksODmGut8ifdI9fOy9xStGaYwDxuhF-6GupjU855aQMiSHsWflSO4EGFMjrSpWK8XlXvsK12gc6UvK3Xqvf2pGzg-KrjojVBav~CRZekFTH4QUcOZE8DmmhSLJsy~zAHlCOqUIxata8RhvCHM44EFhKGO9ZJU5b~zH3dYF0aNDEhVEO6kEdDA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'))
                      ])),
            )
          ],
        ),
      ),
    );
  }
}

enum _TimelineStatus { inputLink, selectKeyword, analysis }

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.analysis;
}

class _Timeline1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const data = _TimelineStatus.values;
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 4.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 40.0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (context, index) {
            if (index == 0) {
              return const Center(
                  child: Text('Input url link',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)));
            } else if (index == 1) {
              return const Center(
                  child: Text('select keywords',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)));
            } else {
              return const Center(
                  child: Text('analysis',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)));
            }
          },
          connectorBuilder: (_, index, __) {
            return const DashedLineConnector();
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.inputLink:
                return const DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(
                        child: Text('1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))));
              case _TimelineStatus.selectKeyword:
                return const DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(
                        child: Text('2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))));
              case _TimelineStatus.analysis:
                return const DotIndicator(
                    color: Color.fromRGBO(152, 142, 207, 1),
                    child: Center(
                        child: Text('3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold))));
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
    urlController.text =
        'https://www.nature.com/articles/s41467-022-29811-6#Abs1';
    super.onInit();
  }

  submit() async {
    Get.toNamed('/select-page');

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://'));
    request.body = json.encode({"url": urlController.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onClose() {
    urlController.dispose();
    super.onClose();
  }
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

final Uri _url = Uri.parse('https://github.com/skyriver228/unix_pongpong');
