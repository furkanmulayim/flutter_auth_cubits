class User {
  final String id;
  final String username;
  final String email;
  final String accessToken;
  final String? firstName;
  final String? lastName;
  final String? refreshToken;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    this.firstName,
    this.lastName,
    this.refreshToken,
  });
}
