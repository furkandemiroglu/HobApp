import 'package:get/get.dart';
import 'package:hobapp/app/modules/mood/mood_controller.dart';

class MoodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoodController>(() => MoodController());
  }
}
