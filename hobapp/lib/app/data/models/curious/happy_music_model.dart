class HappyMusicModel {
  final int? id;
  final String? title;
  final String? artist;
  final List<String>? reviews;
  final String? photo;

  const HappyMusicModel({
    this.artist,
    this.reviews,
    this.photo,
    this.title,
    this.id,
  });

  factory HappyMusicModel.fromJson(Map<dynamic, dynamic> json) =>
      HappyMusicModel(
        id: json['id'],
        title: json['title'],
        artist: json['artist'],
        reviews: List<String>.from(json['reviews'] ?? []),
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'artist': artist,
        'reviews': reviews,
        'photo': photo,
      };
}
