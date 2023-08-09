class AddQuizModel {
  String? grade;
  int? semester;
  String? title;
  String? date;
  String? startTime;
  String? endTime;
  int? numberOfQuestions;
  String? subject;
  List<String>? questions;

  AddQuizModel(
      {this.grade,
        this.semester,
        this.title,
        this.date,
        this.startTime,
        this.endTime,
        this.numberOfQuestions,
        this.subject,
        this.questions});

  AddQuizModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    semester=json['semester'];
    title = json['title'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    numberOfQuestions = json['number_of_questions'];
    subject = json['subject'];
    questions = json['questions'].cast<String>();
  }

  Map<String, dynamic> toJson(AddQuizModel model) {
    return {
    'grade':this.grade,
    'semester':this.semester,
    'title': this.title,
    'date':this.date,
    'start_time': this.startTime,
    'end_time':this.endTime,
    'number_of_questions':this.numberOfQuestions,
    'subject': this.subject,
    'questions':this.questions
    };
  }
}
