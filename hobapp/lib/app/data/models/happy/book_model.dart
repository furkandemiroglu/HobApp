class HappyBookModel {
  final int? id;
  final String? title;
  final String? author;
  final String? review;
  final String? photo;

  const HappyBookModel(
      {this.author, this.review, this.photo, this.title, this.id});

  factory HappyBookModel.fromJson(Map<dynamic, dynamic> json) => HappyBookModel(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        review: json['review'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'review': review,
        'photo': photo,
      };
}
