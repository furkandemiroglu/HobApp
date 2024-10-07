// ignore_for_file: file_names
import 'dart:math';

import 'package:hobapp/app/data/models/book_model.dart';
import 'package:hobapp/app/data/models/movie_model.dart';
import 'package:hobapp/app/data/models/music_model.dart';

List<MusicModel> sadMusicList = [
  const MusicModel(
    id: 1,
    title: 'Hallelujah',
    artist: 'Leonard Cohen',
    photo: 'assets/hale.png',
    reviews: [
      'Üzgünken iyi gidiyor',
    ],
  ),
];

/* */

List<MovieModel> sadMovieList = [
  const MovieModel(
    id: 1,
    title: 'Schinderlin Listesi',
    desc: 'Holokost dönemini anlatan etkileyici bir film.',
    photo: 'assets/sch.jpeg',
    reviews: ['Üzgünken izlenecek en iyi film'],
  ),
];

List<BookModel> sadBookList = [
  const BookModel(
    id: 1,
    title: 'Uçurtma Avcısı',
    desc: 'Bir dostluğun ve kefaretin hikayesini anlatan duygusal bir roman.',
    photo: 'assets/ucurtma.jpeg',
    reviews: ['Harika', 'Muhteşem bir kitap'],
  ),
  // ),
];
// Rastgele bir öğe seçme fonksiyonu
T getSadRandomItem<T>(List<T> list) {
  final random = Random();
  final index = random.nextInt(list.length);
  return list[index];
}
