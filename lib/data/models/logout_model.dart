import 'dart:convert';

LogoutModel logoutModelFromJson(String str) =>
    LogoutModel.fromJson(json.decode(str));

String loginModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  String? messege;
  LogoutModel.fromJson(Map<String, dynamic> json) : messege = json['message'];
  Map<String, dynamic> toJson() => {'message': messege};
}
