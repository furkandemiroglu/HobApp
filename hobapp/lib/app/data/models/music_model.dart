class MusicModel {
  final int? id;
  final String? title;
  final String? artist;
  final List<String>? reviews;
  final String? photo;

  const MusicModel({
    this.artist,
    this.reviews,
    this.photo,
    this.title,
    this.id,
  });

  factory MusicModel.fromJson(Map<dynamic, dynamic> json) =>
      MusicModel(
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
