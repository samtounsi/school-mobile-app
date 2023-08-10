class QuizzesHistoryStudentGetModel {
  final int id;
  final String title;
  final String date;
  final String subject;

  QuizzesHistoryStudentGetModel({
    required this.id,
    required this.title,
    required this.date,
    required this.subject,
  });

  factory QuizzesHistoryStudentGetModel.fromJson(Map<String, dynamic> json) {
    return QuizzesHistoryStudentGetModel(
        id: json['id'],
        title: json['title'],
        date: json['date'],
        subject: json['subject']);
  }
}
