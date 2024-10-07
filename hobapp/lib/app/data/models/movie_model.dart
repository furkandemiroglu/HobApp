class MovieModel {
  final int? id;
  final String? title;
  final String? desc;
  final List<String>? reviews;
  final String? photo;

  const MovieModel(
      {this.desc, this.reviews, this.photo, this.title, this.id});

  factory MovieModel.fromJson(Map<dynamic, dynamic> json) =>
      MovieModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        reviews: List<String>.from(json['reviews'] ?? []),
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'review': reviews,
        'photo': photo,
      };
}
