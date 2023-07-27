class AddProfilePictureResponse {
  String? photo;
  String? message;

  AddProfilePictureResponse({this.photo, this.message});

  AddProfilePictureResponse.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['message'] = this.message;
    return data;
  }
}
