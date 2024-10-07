// ignore_for_file: avoid_print

import 'package:hobapp/app/data/models/users_model.dart';
import 'package:hobapp/app/data/services/database_services.dart';
import 'package:hobapp/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  TextEditingController emailController = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController;
    super.onInit();
  }

  @override
  void onClose() {
    emailController;
    super.onClose();
  }

  checkEmail() async {
    Users? user = await DatabaseService.getUserByEmail(emailController.text);
    if (user == null) {
      // Kullanıcı bulunamadı
      print('KULLANICI BULUNAMADI');
      Get.snackbar(
        'Hata',
        'Girdiğiniz E-Postaya ait kayıt bulunamadı! Lütfen E-Postanızı kontrol edin.',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      // Kullanıcı var
      print('KULLANICI VAR!!!!');
      Get.toNamed('newpass', arguments: emailController.text);
    }
  }
}
