import 'package:client/common.dart';
import 'package:client/pages/Login/login_controller/email_format_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final isEmailValid = false.obs;
  final isPwdValid = false.obs;
  final emailWarning = ''.obs;
  final pwdWarning = ''.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  void emailControllerListener() {
    if (!EmailFormatHelper.isEmailValid(emailController.text.trim()) || emailController.text.isEmpty) {
      emailWarning.value = '올바른 이메일 형식이 아닙니다.';
      isEmailValid.value = false;
    } else {
      emailWarning.value = '';
      isEmailValid.value = true;
    }
  }

  void pwdControllerListener() {
    if (pwdController.text.isEmpty) {
      pwdWarning.value = '비밀번호를 입력해주세요';
      isPwdValid.value = false;

      return;
    }

    if (pwdController.text.length < 8) {
      pwdWarning.value = '8자리 이상의 비밀번호를 입력해주세요';
      isPwdValid.value = false;

      return;
    }

    pwdWarning.value = '';
    isPwdValid.value = true;
  }

  bool verifyStep() {
    emailControllerListener();
    pwdControllerListener();

    if (isEmailValid.value) {}
    if (emailWarning.value != '') {
      Common.CommonSnackBar(messageText: emailWarning.value);
    }

    return (isPwdValid.value && isEmailValid.value && EmailFormatHelper.isEmailValid(emailController.text.trim()));
  }
}
