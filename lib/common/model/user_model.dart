import '../entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.accessToken,
    super.firstName,
    super.lastName,
    super.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      accessToken: json['accessToken'] ?? '',
      firstName: json['firstName'],
      lastName: json['lastName'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'accessToken': accessToken,
      'firstName': firstName,
      'lastName': lastName,
      'refreshToken': refreshToken,
    };
  }
}
