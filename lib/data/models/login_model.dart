import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  String? type;
  int? id;
  String? token;

  LoginModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        type = json['type'],
        id = json['id'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'message': message,
        'type': type,
        'id' : id,
        'token': token,
      };
}
