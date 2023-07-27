class AddProfileBioResponse {
  String? bio;
  String? message;

  AddProfileBioResponse({this.bio, this.message});

  AddProfileBioResponse.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    data['message'] = this.message;
    return data;
  }
}
