import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Common {
  static const double defaultMarginHor = 24.0;
  static const double defaultMarginVer = 24.0;
  static const double defaultBorderRadius = 16.0;
  static const String baseUrl = 'http://35.216.51.145:1337';

  static Widget infoMessage(String text, TextStyle style, double top) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.r, top, 0.0, 0.0),
      child: Row(children: [
        Text(
          text,
          style: style,
        ),
      ]),
    );
  }

  static Widget errorMessage(String text, TextStyle style, double topMargin) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, topMargin, 24.r, 0.0),
      child: Row(children: [
        Text(
          text,
          style: style,
        ),
      ]),
    );
  }

  static Widget textInput({
    required String hintText,
    required TextEditingController textEditingController,
    required double top,
    required TextInputType keyboardType,
    obscureText = false,
    required String errMsg,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 45.r, right: 45.r, top: top),
      child: TextField(
        keyboardType: keyboardType,
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: const Color(0xFFFCFCFC),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: errMsg == '' ? BorderSide(color: Colors.white, width: 0.5.r) : BorderSide(color: Colors.red, width: 1.r),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: errMsg == '' ? BorderSide(color: CommonColor.white, width: 0.5.r) : BorderSide(color: CommonColor.red, width: 1.r),
            borderRadius: BorderRadius.circular(8.r),
          ),
          contentPadding: EdgeInsets.only(left: 24.r, top: 15.r, bottom: 15.5.r, right: 24.r),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          hintText: hintText,
          hintMaxLines: 7,
          hintStyle: CommonTextStyle.regular(color: CommonColor.textB, fontSize: 16),
        ),
      ),
    );
  }

  //onTap 안에 사용하고 싶은 경우 Get.Dialog를 사용하시면 됩니다.
  static Widget commonModal({
    required String mainText,
    Color button1Color = CommonColor.gray01,
    Color button2Color = CommonColor.lightRed,
    String button1Text = '이전',
    String button2Text = '확인',
    Color button1TextColor = const Color(0xFF424242),
    Color button2TextColor = CommonColor.red,
    String button1RoutePath = '',
    String button2RoutePath = '',
    void Function()? button1Function,
    void Function()? button2Function,
  }) {
    return IntrinsicWidth(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        backgroundColor: CommonColor.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 22.r, bottom: 6.r),
                  child: Text(
                    mainText,
                    style: CommonTextStyle.semibold(color: const Color(0xFF424242)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 17.r, bottom: 16.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Material(
                            color: button1Color,
                            child: InkWell(
                              onTap: () {
                                button1RoutePath == '' ? Get.back() : Get.toNamed(button1RoutePath);
                                if (button1Function != null) {
                                  button1Function();
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.r),
                                child: Text(
                                  button1Text,
                                  style: CommonTextStyle.regular(color: button1TextColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget bottomButton(
      {Key? key,
      required BuildContext context,
      buttonColor1 = CommonColor.orange, // 버튼 1의 색상입니다. 디폴트 그레이 고 설정으로 바꿔줄 수 있습니다.

      textColor1 = CommonColor.white, // 버튼 1의 텍스트색상 입니다.
      double button1Margin = 15,
      isButton1Active = true,
      buttonText1 = '다음', // 버튼 1의 텍스트입니다.

      gradientVisible = false,
      void Function()? button1Function,
      void Function()? button2Function,
      double verticalPaddding = 24.0,
      double horizontalPaddding = 46.0,
      double borderRadius = 26.0,
      double buttonText1Size = 16}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 0),
          height: MediaQuery.of(context).viewInsets.bottom <= 0 ? null : 0.r,
          child: Stack(
            children: [
              gradientVisible == true
                  ? Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 24.r,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    Colors.white.withOpacity(0),
                                    Colors.white.withOpacity(1),
                                  ], // red to yellow
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPaddding.r, vertical: verticalPaddding.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: isButton1Active ? button1Function : null,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(button1Margin.r),
                                primary: CommonColor.navy, // foreground
                                backgroundColor: buttonColor1,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.r)),
                              ),
                              child: Text(
                                buttonText1,
                                style: CommonTextStyle.bold(color: textColor1, fontSize: buttonText1Size),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  static Widget registerBottomButton(
      {Key? key,
      required BuildContext context,
      numberOfButton = 2, // 버튼의 개수를 정해주는 변수입니다. 디폴트는 2개고 1개일 때 1개의 버튼이 나오고 나머지는 전부 2개 버튼으로 생성시켜 줍니다.
      buttonColor1 = CommonColor.gray99, // 버튼 1의 색상입니다. 디폴트 그레이 고 설정으로 바꿔줄 수 있습니다.
      buttonColor2 = CommonColor.orange, // 버튼 2의 색상입니다. 디폴트 그레이 고 설정으로 바꿔줄 수 있습니다.
      textColor1 = CommonColor.white, // 버튼 1의 텍스트색상 입니다.
      textColor2 = CommonColor.white, // 버튼 2의 텍스트색상 입니다.
      isButton1Active = true,
      isButton2Active = true,
      buttonText1 = '이전', // 버튼 1의 텍스트입니다.
      buttonText2 = '다음', // 버튼 1의 텍스트입니다.
      gradientVisible = false,
      void Function()? button1Function,
      void Function()? button2Function,
      double verticalPaddding = 24.0,
      double horizontalPaddding = 46.0,
      double borderRadius = 26.0, //border radius
      double button1Margin = 0.0,
      double buttonText1Size = 16}) {
    if (numberOfButton == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            height: MediaQuery.of(context).viewInsets.bottom <= 0 ? null : 0.r,
            child: Stack(
              children: [
                gradientVisible == true
                    ? Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 24.r,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Colors.white.withOpacity(0),
                                      Colors.white.withOpacity(1),
                                    ], // red to yellow
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: verticalPaddding.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: isButton1Active ? button1Function : null,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(9.r),
                                  primary: CommonColor.navy, // foreground
                                  backgroundColor: buttonColor1,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.r)),
                                ),
                                child: Text(
                                  buttonText1,
                                  style: CommonTextStyle(color: textColor1),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            height: MediaQuery.of(context).viewInsets.bottom <= 0 ? null : 0.r,
            child: Stack(
              children: [
                gradientVisible == true
                    ? Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 24.r,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: <Color>[
                                      Colors.white.withOpacity(0),
                                      Colors.white.withOpacity(1),
                                    ], // red to yellow
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: horizontalPaddding.r, vertical: verticalPaddding.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: isButton1Active ? button1Function : null,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(15.r),
                                  primary: CommonColor.navy, // foreground
                                  backgroundColor: buttonColor1,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.r)),
                                ),
                                child: Text(
                                  buttonText1,
                                  style: CommonTextStyle(color: textColor1, fontSize: 16.r),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 11.r),
                            Expanded(
                              child: TextButton(
                                onPressed: isButton2Active ? button2Function : null,
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(15.r),
                                  primary: CommonColor.navy,
                                  backgroundColor: buttonColor2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.r)),
                                ),
                                child: Text(
                                  buttonText2,
                                  style: CommonTextStyle(color: textColor2, fontSize: 16.r),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    }
  }

  static void commonSnackBar(
      {required String messageText, Color textColor = CommonColor.white, Color backgroundColor = CommonColor.orange, dynamic position = SnackPosition.TOP}) {
    Get.rawSnackbar(
      borderRadius: 8.r,
      snackPosition: position,
      margin: position == SnackPosition.BOTTOM ? EdgeInsets.only(top: 16.r, left: 16.r, right: 16.r) : EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      messageText: Text(
        messageText,
        style: CommonTextStyle.bold(color: textColor, fontSize: 16),
      ),
      backgroundColor: backgroundColor,
    );
  }

  static EdgeInsets get sbMargin {
    return EdgeInsets.only(bottom: 10.r, left: 10.r, right: 10.r);
  }

  static double get sbBorderRadius {
    return 5.r;
  }

  static showSnackbar({required String message}) {
    Get.rawSnackbar(
      borderRadius: sbBorderRadius,
      margin: sbMargin,
      backgroundColor: CommonColor.orange,
      snackPosition: SnackPosition.TOP,
      messageText: Text(
        message,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  static Widget commonModalVertical({
    required String mainText,
    required String subText,
    int numberOfButton = 2,
    Color button1Color = CommonColor.orange,
    Color button2Color = CommonColor.orange,
    String button1Text = '사용요청',
    String button2Text = '선물하기',
    Color button1TextColor = CommonColor.white,
    Color button2TextColor = CommonColor.white,
    String button1RoutePath = '',
    String button2RoutePath = '',
    void Function()? button1Function,
    void Function()? button2Function,
  }) {
    return IntrinsicWidth(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.5.r)),
        backgroundColor: CommonColor.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19.5.r),
            border: Border.all(color: CommonColor.orange, width: 1.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 47.r),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 23.r, bottom: 10.r),
                      child: Text(mainText,
                          style: CommonTextStyle.bold(color: const Color(0xFF424242), fontSize: 32.r), overflow: TextOverflow.ellipsis, maxLines: 1)),
                  Divider(color: CommonColor.orange, thickness: 1.r),
                  Padding(
                      padding: EdgeInsets.only(bottom: 40.r, top: 40.r),
                      child: Text('$subText장',
                          style: CommonTextStyle.bold(color: const Color(0xFF424242), fontSize: 40.r), overflow: TextOverflow.ellipsis, maxLines: 1)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.r, left: 15.r, right: 15.r),
                    child: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Material(
                              color: button1Color,
                              child: InkWell(
                                onTap: () {
                                  button1RoutePath == '' ? Get.back() : Get.toNamed(button1RoutePath);
                                  if (button1Function != null) {
                                    button1Function();
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.r),
                                  child: Text(
                                    button1Text,
                                    style: CommonTextStyle.bold(color: button1TextColor, fontSize: 22),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  numberOfButton == 2
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 35.r, left: 15.r, right: 15.r),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Material(
                                    color: button2Color,
                                    child: InkWell(
                                      onTap: () {
                                        button2RoutePath == '' ? Get.back() : Get.toNamed(button2RoutePath);
                                        if (button2Function != null) {
                                          button2Function();
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 23.r),
                                        child: Text(
                                          button2Text,
                                          style: CommonTextStyle.bold(color: button2TextColor, fontSize: 22),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonColor {
  static const yellow = Color(0xFFFDC800);
  static const purple = Color(0xFF5A1EFF);
  static const navy = Color(0xFF000046);
  static const lightRed = Color(0xFFFFEAEA);
  static const lightPurple = Color(0xFFEBE4FF);
  static const lightYellow = Color(0xFFFFF7D9);
  static const white = Color(0xFFFFFFFF);
  static const dullNavy = Color(0xFF19194E);
  static const gary09 = Color(0xFF7D7D7D); // sub text
  static const gray07 = Color(0xFF151523);
  static const gray02 = Color(0xFF414141); // 앱바 텍스트
  static const gray01 = Color(0xFF91949D);
  static const gray00 = Color(0xFF252525);
  static const gray99 = Color(0xFFB6B6B6); // 회원가입 버튼
  static const textA = Color(0xFF222222);
  static const textB = Color(0xFF91949D);
  static const green = Color(0xFF2AC769);
  static const lightGreen = Color(0xFFE5F8ED);
  static const blue = Color(0xFF5B78F6);
  static const blue03 = Color(0xFF56CCF2);
  static const defaultShadow = Color(0x80C8C8D2);
  static const defaultBoxBorder = Color(0xFFC8C8D2);
  static const red = Color(0xFFFB4E4E);
  static const orange = Color(0xFFFE6E00);
  static const deeporange = Color(0xFFF2994A);
  static const black51 = Color(0xFF333333);
}

class CommonTextStyle extends TextStyle {
  CommonTextStyle(
      {Color? color = Colors.black,
      fontFamily = 'NotoSansKR',
      TextDecoration? decoration = TextDecoration.none,
      double? fontSize = 24,
      double? height = 1.34,
      FontWeight? fontWeight})
      : super(color: color, fontFamily: fontFamily, fontSize: fontSize!.sp, height: height, fontWeight: fontWeight, decoration: decoration);

  CommonTextStyle.bold({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w700, height: 1.36);
  CommonTextStyle.medium({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w600, height: 1.36);
  CommonTextStyle.regular({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w400, height: 1.36);
  CommonTextStyle.thin({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w100, height: 1.36);
  CommonTextStyle.semibold({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w600, height: 1.36);
  CommonTextStyle.black({Color color = Colors.black, TextDecoration decoration = TextDecoration.none, double fontSize = 24})
      : this(decoration: decoration, color: color, fontSize: fontSize, fontWeight: FontWeight.w900, height: 1.36);
}
