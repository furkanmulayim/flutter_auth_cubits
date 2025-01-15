import 'dart:convert';

CurrentAuthModel currentFromMap(String str) =>
    CurrentAuthModel.fromMap(json.decode(str));

String currentToMap(CurrentAuthModel data) => json.encode(data.toMap());

class CurrentAuthModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String role;

  CurrentAuthModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.role,
  });

  factory CurrentAuthModel.fromMap(Map<String, dynamic> json) =>
      CurrentAuthModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        username: json["username"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "username": username,
    "role": role,
  };
}
