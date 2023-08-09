class GetStudentsMarksModel {
  int? exist;
  List<Marks>? marks;
  String? message;

  GetStudentsMarksModel({this.exist, this.marks, this.message});

  GetStudentsMarksModel.fromJson(Map<String, dynamic> json) {
    exist = json['exist'];
    if (json['marks'] != null) {
      marks = <Marks>[];
      json['marks'].forEach((v) {
        marks!.add(new Marks.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exist'] = this.exist;
    if (this.marks != null) {
      data['marks'] = this.marks!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Marks {
  String? studentName;
  int? max;
  int? mark;

  Marks({this.studentName, this.max, this.mark});

  Marks.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    max = json['max'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_name'] = this.studentName;
    data['max'] = this.max;
    data['mark'] = this.mark;
    return data;
  }
}
