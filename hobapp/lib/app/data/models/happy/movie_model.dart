class HappyMovieModel {
  final int? id;
  final String? title;
  final String? desc;
  final String? review;
  final String? photo;

  const HappyMovieModel(
      {this.desc, this.review, this.photo, this.title, this.id});

  factory HappyMovieModel.fromJson(Map<dynamic, dynamic> json) =>
      HappyMovieModel(
        id: json['id'],
        title: json['title'],
        desc: json['desc'],
        review: json['review'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'review': review,
        'photo': photo,
      };
}
