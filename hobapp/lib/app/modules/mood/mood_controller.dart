import 'package:hobapp/app/data/models/mood_model.dart';
import 'package:hobapp/core/base/base_controller.dart';
import 'package:get/get.dart';

class MoodController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  List<MoodModel> moodList = [
    const MoodModel(id: 1, title: 'MUTLU'),
    const MoodModel(id: 2, title: 'MERAKLI'),
    const MoodModel(id: 3, title: 'ÜZGÜN'),
    const MoodModel(id: 4, title: 'HEYECANLI'),
    const MoodModel(id: 5, title: 'YORGUN'),
    const MoodModel(id: 6, title: 'AŞIK'),
  ];
}
