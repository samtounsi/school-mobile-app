class QuizzesHistoryTeacherGetModel {
  final int id;
  final String title;
  final String date;
  final String subject;

  QuizzesHistoryTeacherGetModel({required this.id,
    required this.title,
    required this.date,
    required this.subject});

  factory QuizzesHistoryTeacherGetModel.fromJson(Map<String, dynamic>json)
  {
    return QuizzesHistoryTeacherGetModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        subject: json["subject"]);
  }

}
