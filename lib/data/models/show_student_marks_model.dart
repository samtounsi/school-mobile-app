class StudentMarks {
  List<Marks>? marks;
  bool? isExist;
  String? message;

  StudentMarks({this.marks, this.isExist, this.message});

  StudentMarks.fromJson(Map<String, dynamic> json) {
    if (json['marks'] != null) {
      marks = <Marks>[];
      json['marks'].forEach((v) {
        marks!.add(new Marks.fromJson(v));
      });
    }
    isExist = json['is_exist'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marks != null) {
      data['marks'] = this.marks!.map((v) => v.toJson()).toList();
    }
    data['is_exist'] = this.isExist;
    data['message'] = this.message;
    return data;
  }
}

class Marks {
  String? subject;
  double? mark;
  int? totalMark;

  Marks({this.subject, this.mark, this.totalMark});

  Marks.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    mark = json['mark'];
    totalMark = json['total_mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['mark'] = this.mark;
    data['total_mark'] = this.totalMark;
    return data;
  }
}
