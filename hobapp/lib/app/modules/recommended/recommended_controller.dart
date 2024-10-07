// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:hobapp/core/base/base_controller.dart';
import 'package:get/get.dart';

class RecommendeController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  var moodId;

  @override
  void onInit() {
    moodId = Get.arguments;
    print(moodId);
    super.onInit();
  }

  void goToLogin() {
    Get.toNamed('login');
  }

  void goToRegister() {
    Get.toNamed('register');
  }

  List<String> adlar = [
    'Ahmet',
    'Mehmet',
    'Ayşe',
    'Fatma',
    'Ali',
    'Zeynep',
    'Mustafa',
    'Emine',
    'Hüseyin',
    'Hatice',
    'Yusuf',
    'Sultan',
    'İbrahim',
    'Elif',
    'Osman',
    'Aysel',
    'Murat',
    'Sevgi',
    'Hasan',
    'Gül'
  ];

  String rastgeleIsimOlustur() {
    Random random = Random();
    int randomIndex = random.nextInt(adlar.length);
    return adlar[randomIndex];
  }
}
