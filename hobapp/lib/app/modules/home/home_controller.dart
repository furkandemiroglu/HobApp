// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:hobapp/app/data/models/book_model.dart';
import 'package:hobapp/app/data/models/movie_model.dart';
import 'package:hobapp/app/data/models/users_model.dart';
import 'package:hobapp/app/data/services/happy_data.dart';
import 'package:hobapp/app/data/services/love_data.dart';
import 'package:hobapp/core/base/base_controller.dart';
import 'package:get/get.dart';

import '../../data/models/music_model.dart';
import '../../data/services/sad_data.dart';

class HomeController extends BaseController {
  @override
  RxBool get hideAppbar => false.obs;

  late final MusicModel randomMusic;
  late final MovieModel randomMovie;
  late final BookModel randomBook;

  Users? user;
  var data;

  @override
  void onInit() {
    data = Get.arguments;
    randomMusic = getSadRandomItem(sadMusicList);
    randomMovie = getHappyRandomItem(happyMovieList);
    randomBook = getLoveRandomItem(loveBookList);
    print('Haftanın Müziği: ${randomMusic.title}');
    super.onInit();
  }
}
