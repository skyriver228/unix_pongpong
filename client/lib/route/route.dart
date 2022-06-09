import 'package:client/pages/Login/view/login_view_page1.dart';
import 'package:client/pages/Login/view/login_view_page2.dart';
import 'package:client/pages/home_page.dart';
import 'package:get/get.dart';

class GetXRouter {
  static final route = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/login-page1', page: () => const LoginViewPage1()),
    GetPage(name: '/login-page2', page: () => const LoginViewPage2())
  ];
}
