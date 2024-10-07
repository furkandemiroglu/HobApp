// ignore_for_file: avoid_print

import 'package:hobapp/app/data/models/users_model.dart';
import 'package:hobapp/app/data/services/database_services.dart';
import 'package:hobapp/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  RxBool obscurePassword = true.obs;

  @override
  void onInit() {
    emailController;
    passwordController;
    super.onInit();
  }

  @override
  void onClose() {
    emailController;
    passwordController;
    super.onClose();
  }

  /// # [GİRİŞ YAP]
  void login() async {
    if (loginFormKey.currentState!.validate()) {
      Users? user = await DatabaseService.getUserByEmail(emailController.text);
      if (user != null && user.password == passwordController.text) {
        //Get.offAndToNamed('login');
        print(
            'GİRİŞ BAŞARILI KULLANICI BİLGİLERİ: ${user.id} -- ${user.password} -- ${user.email} -- ${user.nameSurname} -- ${user.date} -- ${user.zodiac}');
        Get.offAndToNamed('home', arguments: user.id);
      } else {
        Get.snackbar(
          'Hata',
          'Girdiğiniz bilgilere ait kullanıcı bulunamadı! Lütfen girilen bilgileri kontrol edin.',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  /// # [PAROLAMI UNUTTUM SAYFASI]
  void forgotPassword() {
    Get.offAndToNamed('forgotpass');
  }

  /// # [KAYIT OL SAYFASI]
  void register() {
    Get.offAndToNamed('register');
  }

  /// # [PAROLAYI GOSTER GIZLE]

  void showOrhidePassword() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  /// # [E-POSTA VALIDASYONU - DOĞRULAMASI]
}
