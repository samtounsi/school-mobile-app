class LoginModel {
  String? message;
  String? type;
  int? id;
  int? profileId;
  String? token;

  LoginModel({this.message, this.type, this.id, this.profileId, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    type = json['type'];
    id = json['id'];
    profileId = json['profile_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['type'] = this.type;
    data['id'] = this.id;
    data['profile_id'] = this.profileId;
    data['token'] = this.token;
    return data;
  }
}
