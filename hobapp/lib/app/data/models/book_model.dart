class BookModel {
  final int? id;
  final String? title;
  final String? author;
  final String? desc;
  final List<String>? reviews;
  final String? photo;

  const BookModel(
      {this.author, this.desc, this.reviews, this.photo, this.title, this.id});

  factory BookModel.fromJson(Map<dynamic, dynamic> json) => BookModel(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        desc: json['desc'],
        reviews: json['reviews'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'desc': desc,
        'reviews': reviews,
        'photo': photo,
      };
}
