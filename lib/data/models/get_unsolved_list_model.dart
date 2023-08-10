class UnSolvedListModel {
  final int id;
  final String title;
  final String date;
  final String startTime;
  final String endTime;
  final int numberOfQuestion;
  final int semester;
  final String createdAt;
  final String updatedAt;
  final int teacherSubjectId;
  final int gradeId;
  final String subjectName;

  UnSolvedListModel(
      {required this.id,
      required this.title,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.numberOfQuestion,
      required this.semester,
      required this.createdAt,
      required this.updatedAt,
      required this.teacherSubjectId,
      required this.gradeId,
      required this.subjectName});

  factory UnSolvedListModel.fromJson(Map<String, dynamic> json) {
    return UnSolvedListModel(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        numberOfQuestion: json['number_of_questions'],
        semester: json['semester'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        teacherSubjectId: json['teacherSubjectId'],
        gradeId: json['gradeId'],
    subjectName: json['subject_name']);
  }
}
