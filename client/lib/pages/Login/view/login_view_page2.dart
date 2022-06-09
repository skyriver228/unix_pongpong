import 'package:client/pages/Login/login_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewPage2 extends StatelessWidget {
  const LoginViewPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController contoller = Get.put(LoginController());
    // final googleLoginController = Get.put(GoogleLoginController());
    // final kakaoLoginController = Get.put(KakaoLoginController());
    return DefaultTextHeightBehavior(
      textHeightBehavior: const TextHeightBehavior(leadingDistribution: TextLeadingDistribution.even),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF242731),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      color: const Color(0xFF111111),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Image.asset(
                      'assets/Draft.png',
                      width: 320,
                      height: 150,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: 1,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF242731)),
                          width: 300,
                          height: 260,
                          child: Center(
                            child: Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text(
                                      'Log in',
                                      style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFFAFAFB), fontWeight: FontWeight.w600, fontSize: 18),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    decoration: BoxDecoration(color: const Color(0xFF42424A), borderRadius: BorderRadius.circular(20)),
                                    width: 260,
                                    height: 38,
                                    child: const TextField(
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(fontFamily: 'Roboto', color: Color(0xFF92929D), fontWeight: FontWeight.w600, fontSize: 14),
                                      decoration: InputDecoration(
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 24),
                                          hintText: 'Your email',
                                          hintStyle: TextStyle(fontFamily: 'Roboto', color: Color(0xFF92929D), fontWeight: FontWeight.w600, fontSize: 14)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    decoration: BoxDecoration(color: const Color(0xFF42424A), borderRadius: BorderRadius.circular(20)),
                                    width: 260,
                                    height: 38,
                                    child: const TextField(
                                      obscureText: true,
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(fontFamily: 'Roboto', color: Color(0xFF92929D), fontWeight: FontWeight.w600, fontSize: 14),
                                      decoration: InputDecoration(
                                          fillColor: Colors.transparent,
                                          filled: true,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 15, top: 5, bottom: 15, right: 24),
                                          hintText: 'Your Password',
                                          hintStyle: TextStyle(fontFamily: 'Roboto', color: Color(0xFF92929D), fontWeight: FontWeight.w600, fontSize: 14)),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.1,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20, bottom: 5),
                                    width: 240,
                                    height: 2,
                                    color: const Color(0xFFE4E4E4),
                                  ),
                                ),
                                SizedBox(
                                  width: 270,
                                  height: 40,
                                  child: InkWell(
                                    onTap: () {}, // 로그인후 진입할곳
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF6C5DD3),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text(
                                          'Log in',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFFFAFAFB), fontWeight: FontWeight.w600, fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
