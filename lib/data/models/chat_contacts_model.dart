class ChatContactsModel {
  String? message;
  List<Contacts>? contacts;

  ChatContactsModel({this.message, this.contacts});

  ChatContactsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  int? userId;
  int? id;
  String? photo;
  String? fullName;
  String? type;

  Contacts({this.userId, this.id, this.photo, this.fullName, this.type});

  Contacts.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    id = json['id'];
    photo = json['photo'];
    fullName = json['full_name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['full_name'] = this.fullName;
    data['type'] = this.type;
    return data;
  }
}
