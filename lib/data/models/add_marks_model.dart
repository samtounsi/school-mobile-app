class AddMarksModel {
  String? semester;
  String? subject;
  String? type;
  String? grade;
  int? section;
  List<Mark>? marks;

  AddMarksModel(
      {this.semester,
        this.subject,
        this.type,
        this.grade,
        this.section,
        this.marks});

  AddMarksModel.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    subject = json['subject'];
    type = json['type'];
    grade = json['grade'];
    section = json['section'];
    if (json['marks'] != null) {
      marks = <Mark>[];
      json['marks'].forEach((v) {
        marks!.add(new Mark.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson({required AddMarksModel model}) {
  return {
  'semester': model.semester,
  'subject':model.subject,
    'type':model.type,
    'grade':model.grade,
    'section': model.section,
    'marks':model.marks?.map((v) => v.toJson(model: v)).toList()
  };

  }
}

class Mark {
  String? studentName;
  int? mark;

  Mark({this.studentName, this.mark});

  Mark.fromJson(Map<String, dynamic> json) {
    studentName = json['student_name'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson({required Mark model}) {
    return{
      'student_name':model.studentName,
      'mark':model.mark
    };
  }
}
