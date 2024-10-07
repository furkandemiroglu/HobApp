// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';

import 'package:hobapp/app/data/models/users_model.dart';
import 'package:hobapp/app/data/services/database_services.dart';
import 'package:hobapp/core/base/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final registerFormKey = GlobalKey<FormState>();
  var selectedDate = DateTime(2000).obs;
  var parse;
  var zodiacDay;
  var zodiacMonth;
  RxString zodiacSign = ''.obs;

  @override
  void onInit() {
    nameSurnameController;
    dateController;
    emailController;
    passwordController;
    super.onInit();
  }

  @override
  void onClose() {
    nameSurnameController;
    dateController;
    emailController;
    passwordController;
    super.onClose();
  }

  void goToHome() {
    Get.offAndToNamed('home');
  }

  void goToLogin() {
    Get.toNamed('login');
  }

  /// [DATE TIME PICKER]
  void chooseDate() async {
    if (Platform.isAndroid) {
      DateTime? pickedDate = await showDatePicker(
        locale: const Locale('tr'),
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        initialDatePickerMode: DatePickerMode.day,
        helpText: 'Doğum Tarihini Seçiniz',
        cancelText: 'Kapat',
        confirmText: 'Onayla',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'Doğum Tarihini Giriniz',
        fieldHintText: 'Month/Date/Year',
        //selectableDayPredicate: disableDate
      );
      if (pickedDate != null && pickedDate != selectedDate.value) {
        selectedDate.value = pickedDate;

        dateController = TextEditingController(
            text:
                DateFormat("dd.MM.yyyy").format(selectedDate.value).toString());
        print(dateController.text);
        zodiacDay = DateFormat('dd').format(selectedDate.value).toString();
        zodiacMonth = DateFormat('MM').format(selectedDate.value).toString();
        print(zodiacDay);
        print(zodiacMonth);
        getZodiacSign(zodiacDay, zodiacMonth);
        update();
      }
    }
    if (Platform.isIOS) {
      DateTime? chosenDateTime = await showCupertinoModalPopup(
          context: Get.context!,
          builder: (BuildContext builder) {
            return CupertinoActionSheet(
              actions: [
                Container(
                  height:
                      MediaQuery.of(Get.context!).copyWith().size.height * 0.25,
                  color: Colors.white,
                  child: CupertinoDatePicker(
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (value) {
                      selectedDate.value = value;
                      parse =
                          DateFormat('dd.MM.yyyy').format(selectedDate.value);
                    },
                    initialDateTime: selectedDate.value,
                    minimumYear: 1900,
                    maximumYear: 2222,
                  ),
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('Tamam'),
                onPressed: () {
                  Get.close(0);
                },
              ),
            );
          });
      update();
      if (parse != null && parse != selectedDate.value) {
        dateController = TextEditingController(text: parse);
        zodiacDay = DateFormat('dd').format(selectedDate.value).toString();
        zodiacMonth = DateFormat('MM').format(selectedDate.value).toString();
        print(zodiacDay);
        print(zodiacMonth);
        print(dateController.text);
        getZodiacSign(int.parse(zodiacDay), int.parse(zodiacMonth));
        update();
      }
    }
    update();
  }

  /// [TARIHE GORE BURC BULMA]
  String getZodiacSign(int day, int month) {
    if ((month == 1 && day <= 20) || (month == 12 && day >= 22)) {
      zodiacSign.value = 'Oğlak';
    } else if ((month == 1 && day >= 21) || (month == 2 && day <= 18)) {
      zodiacSign.value = 'Kova';
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      zodiacSign.value = 'Balık';
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
      zodiacSign.value = 'Koç';
    } else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
      zodiacSign.value = 'Boğa';
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
      zodiacSign.value = 'İkizler';
    } else if ((month == 6 && day >= 22) || (month == 7 && day <= 22)) {
      zodiacSign.value = 'Yengeç';
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 23)) {
      zodiacSign.value = 'Aslan';
    } else if ((month == 8 && day >= 24) || (month == 9 && day <= 23)) {
      zodiacSign.value = 'Başak';
    } else if ((month == 9 && day >= 24) || (month == 10 && day <= 23)) {
      zodiacSign.value = 'Terazi';
    } else if ((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
      zodiacSign.value = 'Akrep';
    } else if ((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
      zodiacSign.value = 'Yay';
    }
    print(zodiacSign.value);
    return zodiacSign.value;
  }

  /// [KULLANICIYI KAYDETME]
  saveUserLocalDb() async {
    if (registerFormKey.currentState!.validate()) {
      Users user = Users(
          nameSurname: nameSurnameController.text,
          date: dateController.text,
          email: emailController.text,
          password: passwordController.text,
          zodiac: zodiacSign.value);

      bool isEmailUnique = await DatabaseService.isEmailUnique(user.email!);

      if (!isEmailUnique) {
        // E-posta adresi zaten kayıtlı olduğunda hata mesajını göster
        Get.snackbar(
          'Hata',
          'Bu e-posta adresi zaten kayıtlı. Lütfen farklı bir e-posta ile kayıt olmayı deneyin',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        return; // Kaydı durdur
      }

      int result = await DatabaseService.saveUsers(user);
      if (result > 0) {
        print(
            'KAYIT BAŞARILI KULLANICI BİLGİLERİ: ${user.id} -- ${user.password} -- ${user.email} -- ${user.nameSurname} -- ${user.date} -- ${user.zodiac}');
        Get.snackbar(
          'Başarılı',
          'Kayıt işlemi başarıyla tamamlandı. Giriş sayfasına yönlendiriliyorsunuz',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          snackbarStatus: (status) {
            print(status);
            if (status == SnackbarStatus.CLOSED) {
              goToLogin();
            }
          },
        );
      }
    }
  }
}
