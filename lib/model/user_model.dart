class User {
  final int id;
  final String name;
  final String email;
  final String occupation;
  final String bio;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.occupation,
    required this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Providing a default value
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      occupation: json['occupation'] ?? '',
      bio: json['bio'] ?? '',
    );
  }
}
