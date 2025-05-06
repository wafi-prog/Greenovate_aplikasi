import 'dart:convert';

class RegisterRequestModel {
  final String? name;
  final String? email;
  final String? telpon;
  final String? password;
  final String? passwordConfirmation;  

  RegisterRequestModel({
    this.name,
    this.email,
    this.telpon,
    this.password,
    this.passwordConfirmation,  
  });

  factory RegisterRequestModel.fromJson(String str) =>
      RegisterRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterRequestModel.fromMap(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        telpon: json["telpon"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],  // Sesuaikan dengan nama field
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "telpon": telpon,
        "password": password,
        "password_confirmation": passwordConfirmation,  // Kirimkan field ini juga
      };
}
