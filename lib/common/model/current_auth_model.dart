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
  final String phone;
  final String gender;
  final int age;
  final String birthDate;
  final Address? address;
  final Company? company;
  final Bank? bank;
  final String eyeColor;
  final Hair? hair;
  final double height;
  final double weight;
  final String bloodGroup;

  CurrentAuthModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.role,
    required this.phone,
    required this.gender,
    required this.age,
    required this.birthDate,
    this.address,
    this.company,
    this.bank,
    required this.eyeColor,
    this.hair,
    required this.height,
    required this.weight,
    required this.bloodGroup,
  });

  factory CurrentAuthModel.fromMap(Map<String, dynamic> json) =>
      CurrentAuthModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        username: json["username"],
        role: json["role"],
        phone: json["phone"],
        gender: json["gender"],
        age: json["age"],
        birthDate: json["birthDate"],
        address: json["address"] != null
            ? Address.fromMap(json["address"])
            : null,
        company: json["company"] != null
            ? Company.fromMap(json["company"])
            : null,
        bank: json["bank"] != null ? Bank.fromMap(json["bank"]) : null,
        eyeColor: json["eyeColor"],
        hair: json["hair"] != null ? Hair.fromMap(json["hair"]) : null,
        height: json["height"]?.toDouble() ?? 0.0,
        weight: json["weight"]?.toDouble() ?? 0.0,
        bloodGroup: json["bloodGroup"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "username": username,
    "role": role,
    "phone": phone,
    "gender": gender,
    "age": age,
    "birthDate": birthDate,
    "address": address?.toMap(),
    "company": company?.toMap(),
    "bank": bank?.toMap(),
    "eyeColor": eyeColor,
    "hair": hair?.toMap(),
    "height": height,
    "weight": weight,
    "bloodGroup": bloodGroup,
  };
}

class Address {
  final String address;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    address: json["address"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postalCode"],
    country: json["country"],
  );

  Map<String, dynamic> toMap() => {
    "address": address,
    "city": city,
    "state": state,
    "postalCode": postalCode,
    "country": country,
  };
}

class Company {
  final String name;
  final String department;
  final String title;

  Company({
    required this.name,
    required this.department,
    required this.title,
  });

  factory Company.fromMap(Map<String, dynamic> json) => Company(
    name: json["name"],
    department: json["department"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "department": department,
    "title": title,
  };
}

class Bank {
  final String cardType;
  final String cardNumber;
  final String currency;
  final String iban;

  Bank({
    required this.cardType,
    required this.cardNumber,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    cardType: json["cardType"],
    cardNumber: json["cardNumber"],
    currency: json["currency"],
    iban: json["iban"],
  );

  Map<String, dynamic> toMap() => {
    "cardType": cardType,
    "cardNumber": cardNumber,
    "currency": currency,
    "iban": iban,
  };
}

class Hair {
  final String type;
  final String color;

  Hair({
    required this.type,
    required this.color,
  });

  factory Hair.fromMap(Map<String, dynamic> json) => Hair(
    type: json["type"],
    color: json["color"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "color": color,
  };
}