import 'package:get/get.dart';
import 'package:hobapp/app/modules/recommended/recommended_controller.dart';

class RecommendedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecommendeController>(() => RecommendeController());
  }
}
