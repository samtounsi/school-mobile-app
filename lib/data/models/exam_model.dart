class ExamScheduleModel {
  int? exist;
  List<ExamsList>? examsList;
  String? message;

  ExamScheduleModel({this.exist, this.examsList, this.message});

  ExamScheduleModel.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    if (json['exams_list'] != null) {
      examsList = <ExamsList>[];
      json['exams_list'].forEach((v) {
        examsList!.add(new ExamsList.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exist'] = this.exist;
    if (this.examsList != null) {
      data['exams_list'] = this.examsList!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ExamsList {
  String? subject;
  String? date;
  String? period;

  ExamsList({this.subject, this.date, this.period});

  ExamsList.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    date = json['date'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['date'] = this.date;
    data['period'] = this.period;
    return data;
  }
}
