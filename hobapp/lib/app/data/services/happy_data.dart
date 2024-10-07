// ignore_for_file: file_names
import 'dart:math';

import 'package:hobapp/app/data/models/book_model.dart';
import 'package:hobapp/app/data/models/movie_model.dart';
import 'package:hobapp/app/data/models/music_model.dart';

List<MusicModel> happyMusicList = [
  const MusicModel(
    id: 1,
    title: 'Happy',
    artist: 'Pharrell Williams',
    photo: 'assets/happy.jpeg',
    reviews: [
      'ÇOK İYİ MÜZİK',
      'Harika bir şarkı',
      'ÇOK İYİ MÜZİK',
      'Harika bir şarkı',
    ],
  ),
  const MusicModel(
    id: 2,
    title: 'Dont Stop Me Now',
    artist: 'Queen',
    photo: 'assets/dont.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
  const MusicModel(
    id: 3,
    title: 'Lovely Day',
    artist: 'Bill Withers',
    photo: 'assets/lovely.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
];

List<MovieModel> happyMovieList = [
  const MovieModel(
    id: 1,
    title: 'La La Land',
    desc:
        'Bir oyuncu ve bir caz piyanisti arasındaki romantik bir hikayeyi anlatan müzikal film.',
    photo: 'assets/lala.jpg',
    reviews: ['Harika', 'Kesinlikle izleyin'],
  ),
  const MovieModel(
    id: 2,
    title: 'Forrest Gumpp',
    desc:
        'Forrest Gumpın hayatının olağanüstü serüvenlerini anlatan kalpleri ısıtan bir film.',
    photo: 'assets/forest.jpeg',
    reviews: ['Muhteşem', 'Harika bir film'],
  ),
];

List<BookModel> happyBookList = [
  const BookModel(
    id: 1,
    title: 'Simyacı',
    desc:
        'Bir oyuncu ve bir caz piyanisti arasındaki romantik bir hikayeyi anlatan müzikal film.',
    photo: 'assets/simya.jpeg',
    reviews: ['Harika', 'Kesinlikle izleyin'],
  ),
  // const BookModel(
  //   id: 1,
  //   title: 'La La Land',
  //   author:
  //       'Bir oyuncu ve bir caz piyanisti arasındaki romantik bir hikayeyi anlatan müzikal film.',
  //   photo: 'assets/lala.jpg',
  //   reviews: ['Harika', 'Kesinlikle izleyin'],
  // ),
];

// Rastgele bir öğe seçme fonksiyonu
T getHappyRandomItem<T>(List<T> list) {
  final random = Random();
  final index = random.nextInt(list.length);
  return list[index];
}
