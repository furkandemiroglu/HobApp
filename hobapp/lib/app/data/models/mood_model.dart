class MoodModel {
  final int? id;
  final String? title;

  const MoodModel({this.title, this.id});

  factory MoodModel.fromJson(Map<dynamic, dynamic> json) =>
      MoodModel(id: json['id'], title: json['title']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
