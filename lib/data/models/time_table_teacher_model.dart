class TimeTableTeacherModel {
  final int lessonNumber;
  final String section;
  final String grade;
  final String subject;
  final String startTime;
  final String endTime;

  TimeTableTeacherModel({
    required this.lessonNumber,
    required this.section,
    required this.grade,
    required this.subject,
    required this.startTime,
    required this.endTime});

  factory TimeTableTeacherModel.fromJson(Map<String, dynamic>json)
  {
    return TimeTableTeacherModel(
        lessonNumber: json['lesson_number'],
        section: json['section'],
        grade: json['grade'],
        subject: json['subject'],
        startTime:json['start_time'],
        endTime: json['end_time']);
  }
}

