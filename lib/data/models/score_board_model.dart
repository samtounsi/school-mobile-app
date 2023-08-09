class ScoreBoardModel {
  List<Scoreboard>? scoreboard;
  String? message;

  ScoreBoardModel({this.scoreboard, this.message});

  ScoreBoardModel.fromJson(Map<String, dynamic> json) {
    if (json['scoreboard'] != null) {
      scoreboard = <Scoreboard>[];
      json['scoreboard'].forEach((v) {
        scoreboard!.add(new Scoreboard.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scoreboard != null) {
      data['scoreboard'] = this.scoreboard!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Scoreboard {
  String? name;
  int? numberOfAnswers;
  int? time;

  Scoreboard({this.name, this.numberOfAnswers, this.time});

  Scoreboard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    numberOfAnswers = json['number_of_answers'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number_of_answers'] = this.numberOfAnswers;
    data['time'] = this.time;
    return data;
  }
}
