class MessagesHistoryModel {
  String? message;
  List<Messages>? messages;

  MessagesHistoryModel({this.message, this.messages});

  MessagesHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  String? message;
  String? time;
  String? type;

  Messages({this.message, this.time, this.type});

  Messages.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    time = json['time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['time'] = this.time;
    data['type'] = this.type;
    return data;
  }
}
