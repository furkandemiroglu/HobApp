import 'package:hobapp/core/base/base_controller.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  void goToLogin() {
    Get.toNamed('login');
  }

  void goToRegister() {
    Get.toNamed('register');
  }

// final MyRepository repository;
// SplashController(this.repository);

//   final _obj = ''.obs;
//   set obj(value) => this._obj.value = value;
//   get obj => this._obj.value;
}
