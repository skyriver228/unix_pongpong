import 'package:client/pages/home_page.dart';
import 'package:client/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //main에서 비동기 메소드 사용할때 사용
      runApp(
        GetMaterialApp(
            theme: ThemeData(fontFamily: 'Pretendard'), //전체 테마 폰트를 설정해뒀음. 변경하고 싶으면 Theme.of().textTheme 사용하면 됨
            debugShowCheckedModeBanner: true, //Debug 모양 나오는거 없애기
            locale: Get.deviceLocale, //현재 표시할 언어(디바이스) 설정
            defaultTransition: Transition.cupertino,
            home: const HomePage(), //home을 실행할때 로딩창으로 띄움
            getPages: GetXRouter.route
        ));
}