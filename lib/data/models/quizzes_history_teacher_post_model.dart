class QuizzesHistoryTeacherQuestionPostModel {
  QuizzesHistoryTeacherQuestionPostModel({
    required this.questions,
    required this.message,
  });

  late final Questions questions;
  late final String message;

  QuizzesHistoryTeacherQuestionPostModel.fromJson(Map<String, dynamic> json) {
    questions = Questions.fromJson(json['questions']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['questions'] = questions.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Questions {
  Questions({
    required this.title,
    required this.date,
    required this.startTime,
    required this.questions,
  });

  late final String title;
  late final String date;
  late final String startTime;
  late final List<QuestionHTeacher> questions;

  Questions.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    date = json['date'];
    startTime = json['start_time'];
    questions = List.from(json['questions'])
        .map((e) => QuestionHTeacher.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['date'] = date;
    _data['start_time'] = startTime;
    _data['questions'] = questions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class QuestionHTeacher {
  late final String statement;
  late final List<String> choices;
  late final int answer;

  QuestionHTeacher(
      {required this.statement,
      required this.choices,
      required this.answer});
  QuestionHTeacher.fromJson(Map<String, dynamic> json) {
    statement = json['statement'];
    choices = (json['choices'] as List).map((e) => e.toString()).toList();
    answer=json['answer'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statement'] = statement;
    _data['choices'] = choices.map((e) => e.toString()).toList();
    _data['answer'] = answer;

    return _data;
  }


}
