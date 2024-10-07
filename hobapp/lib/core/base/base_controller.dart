import 'package:hobapp/core/utils/extensions/form_validation_extension.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool hideAppbar = true.obs;

  void onRefresh() {}

  void onLoadMore() {}

  emailValidation(String email) {
    return email.validateEmail(email);
  }

  /// # [PAROLA VALIDASYONU - DOĞRULAMASI]
  passwordValidation(String password) {
    return password.validatePassword(password);
  }

  /// # [AD SOYAD VALİDASYONU - DOĞRULAMASI]
  nameSurnameValidation(String nameSurname) {
    return nameSurname.validateNameAndSurname(nameSurname);
  }
}
