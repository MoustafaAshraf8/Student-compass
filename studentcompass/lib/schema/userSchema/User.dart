class User {
  int id;
  String name;
  String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['person_id'],
      name: json['person_name'],
      email: json['person_email'],
    );
  }
}
