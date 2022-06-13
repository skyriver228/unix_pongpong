import 'package:client/pages/Login/view/login_view_page1.dart';
import 'package:client/pages/Login/view/login_view_page2.dart';
import 'package:client/pages/analysis_page.dart';
import 'package:client/pages/home_page.dart';
import 'package:client/pages/select_page.dart';
import 'package:get/get.dart';

class GetXRouter {
  static final route = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/login-page1', page: () => const LoginViewPage1()),
    GetPage(name: '/login-page2', page: () => const LoginViewPage2()),
    GetPage(name: '/select-page', page: () => const SelectKeywordPage()),
    GetPage(name: '/analysis-page', page: () => const AnalysisPage())
  ];
}
