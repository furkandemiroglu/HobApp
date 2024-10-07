// ignore_for_file: unrelated_type_equality_checks, avoid_print
import 'package:hobapp/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/database_services.dart';

class NewPasswordController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final newPasswordFormKey = GlobalKey<FormState>();
  RxBool obscurePassword = true.obs;
  RxBool obscureRePassword = true.obs;

  @override
  void onInit() {
    passwordController;
    rePasswordController;
    super.onInit();
  }

  @override
  void onClose() {
    passwordController;
    rePasswordController;
    super.onClose();
  }

  void changePassword() async {
    try {
      if (passwordController.text == rePasswordController.text) {
        var email = Get.arguments;
        // Kullanıcının parolasını güncelleyin
        await DatabaseService.updateUserPassword(email, passwordController.text)
            .whenComplete(() {
          Get.snackbar(
            'Başarılı',
            'Parolanız başarıyla değiştirildi! Giriş sayfasına yönlendiriliyorsunuz.',
            duration: const Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM,
            snackbarStatus: (status) {
              print(status);
              if (status == SnackbarStatus.CLOSED) {
                Get.offAndToNamed('login');
              }
            },
          );
        });
      } else {
        print('PAROLALAR EŞLEŞMİYOR');
        Get.snackbar(
          'Hata',
          'Girdiğiniz Parolalar eşleşmiyor. Lütfen parolanızı kontrol edin!',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      // Hata meydana geldi
      print('Bir hata oluştu: $e');
    }
  }

  void showOrhidePassword() {
    obscurePassword.value = !obscurePassword.value;
    update();
  }

  void showOrhideRePassword() {
    obscureRePassword.value = !obscureRePassword.value;
    update();
  }
}
