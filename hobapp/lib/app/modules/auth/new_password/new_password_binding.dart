import 'package:hobapp/app/modules/auth/new_password/new_password_controller.dart';
import 'package:get/get.dart';

class NewPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}
