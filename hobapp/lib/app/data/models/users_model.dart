class Users {
  final int? id;
  final String? nameSurname;
  final String? email;
  final String? password;
  final String? date;
  final String? zodiac;

  const Users(
      {this.nameSurname,
      this.email,
      this.password,
      this.date,
      this.zodiac,
      this.id});

  factory Users.fromJson(Map<dynamic, dynamic> json) => Users(
      id: json['id'],
      nameSurname: json['nameSurname'],
      email: json['email'],
      password: json['password'],
      date: json['date'],
      zodiac: json['zodiac']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameSurname': nameSurname,
        'email': email,
        'password': password,
        'date': date,
        'zodiac': zodiac,
      };
}
