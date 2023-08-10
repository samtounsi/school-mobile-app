import 'package:flutter/cupertino.dart';

class QuizzesStudentPostModel {
  QuizzesStudentPostModel({
    required this.quiz,
    required this.allow,
  });

  late final Quiz quiz;
  late final int allow;

  QuizzesStudentPostModel.fromJson(Map<String, dynamic> json) {
    quiz = Quiz.fromJson(json['quiz']);
    allow=json['allow'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['quiz'] = quiz.toJson();
    _data['allow'] = allow;
    return _data;
  }
}

class Quiz {
  Quiz({
    required this.numberOfQuestions,
    required this.duration,
    required this.grade,
    required this.subject,
    required this.questions,
  });

  late final int numberOfQuestions;
  late final int duration;
  late final String grade;
  late final String subject;
  late final List<Questions> questions;

  Quiz.fromJson(Map<String, dynamic> json) {
    numberOfQuestions = json['number_of_questions'];
    duration = json['duration'];
    grade = json['grade'];
    subject = json['subject'];
    questions =
        List.from(json['questions']).map((e) => Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number_of_questions'] = numberOfQuestions;
    _data['duration'] = duration;
    _data['grade'] = grade;
    _data['subject'] = subject;
    _data['questions'] = questions.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.statement,
    required this.answer,
    required this.options,
    required this.isSelected,
  });

  late final int id;
  late final String statement;
  late final int answer;
  late final List<Options> options;
  bool isSelected = false;

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statement = json['statement'];
    answer = json['answer'];
    options =
        List.from(json['options']).map((e) => Options.fromJson(e)).toList();
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['statement'] = statement;
    _data['answer'] = answer;
    _data['options'] = options.map((e) => e.toJson()).toList();
    _data['isSelected'] = isSelected;
    return _data;
  }
}

class Options {
  Options({
    required this.text,
    required this.isSelected,
  });

  late final String text;
  bool isSelected = false;

  Options.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['isSelected'] = isSelected;
    return _data;
  }
}
