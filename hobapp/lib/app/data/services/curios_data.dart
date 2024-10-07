// ignore_for_file: file_names
import 'dart:math';

import 'package:hobapp/app/data/models/book_model.dart';
import 'package:hobapp/app/data/models/movie_model.dart';
import 'package:hobapp/app/data/models/music_model.dart';

List<MusicModel> curiosMusicList = [
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
    title: 'Happy',
    artist: 'Pharrell Williams',
    photo: 'assets/happy.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
  const MusicModel(
    id: 3,
    title: 'Happy',
    artist: 'Pharrell Williams',
    photo: 'assets/happy.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
];

/* */

List<MovieModel> curiosMovieList = [
  const MovieModel(
    id: 1,
    title: 'La La Land',
    desc:
        'Bir oyuncu ve bir caz piyanisti arasındaki romantik bir hikayeyi anlatan müzikal film.',
    photo: 'assets/happy.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
  const MovieModel(
    id: 2,
    title: 'Happy',
    desc: 'Pharrell Williams',
    photo: 'assets/happy.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
  const MovieModel(
    id: 3,
    title: 'Happy',
    desc: 'Pharrell Williams',
    photo: 'assets/happy.jpeg',
    reviews: ['ÇOK İYİ MÜZİK', 'Harika bir şarkı'],
  ),
];

List<BookModel> curiosBookList = [
  const BookModel(
    id: 1,
    title: 'Uçurtma Avcısı',
    desc: 'Bir dostluğun ve kefaretin hikayesini anlatan duygusal bir roman.',
    photo: 'assets/ucurtma.jpeg',
    reviews: ['Harika', 'Muhteşem bir kitap'],
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
T getCuriosRandomItem<T>(List<T> list) {
  final random = Random();
  final index = random.nextInt(list.length);
  return list[index];
}

/* 
recommended

"Happy" - Pharrell Williams
"Don't Stop Me Now" - Queen
"Three Little Birds" - Bob Marley
"Lovely Day" - Bill Withers
"Dancing Queen" - ABBA
"I Wanna Dance with Somebody" - Whitney Houston


*/