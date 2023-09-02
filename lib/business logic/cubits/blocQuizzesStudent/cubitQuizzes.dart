import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocQuizzesStudent/stateQuizzes.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_schoolapp/data/models/get_unsolved_list_model.dart';
import 'package:mobile_schoolapp/data/models/submission_model.dart';

import '../../../data/models/quizzes_get_student_model.dart';
import '../../../presentation/components and constants/constants.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(InitialStateQuizzes());

  //Timer
  Timer? countdown;
  Duration? myDur;
  int reduction = 1;

  void countDown() {
     dynamic seconds = myDur!.inSeconds - reduction;
    myDur = Duration(seconds: seconds);
    emit(QuizTimerCountdownState());
    print(countdown!.tick.toString());
  }

  void startTimer(int timer) {
    myDur = Duration(minutes: timer);
    emit(QuizTimerStartState());
    countdown =
        Timer.periodic(Duration(seconds: reduction), (timer) => countDown());
  }

  void stopTimer() {
    emit(QuizTimerEndState());
    countdown!.cancel();
    print(myDur!.inSeconds);
  }

  String showHours() {
    String hours = myDur!.inHours.remainder(24).toString().padLeft(2, '0');
    return '${hours}';
  }

  String showMinutes() {
    String minutes = myDur!.inMinutes.remainder(60).toString().padLeft(2, '0');
    return '${minutes}';
  }

  String showSeconds() {
    String seconds = myDur!.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${seconds}';
  }

  //Quiz
  static QuizCubit get(context) => BlocProvider.of(context);

  QuizzesStudentPostModel? quizStudentPostModel;
  void quizzesStudentPost(int id) async {
    if (quizStudentPostModel != null) quizStudentPostModel = null;

    emit(QuizzesLoadingState());

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://new-school-management-system.onrender.com/mob/get_quiz"),
      );
      request.fields.addAll({'quiz': id.toString()});

      request.headers.addAll({
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      });
// we send request in this line
      final response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);

      print(json);
      print(myResponse.statusCode);

      if (myResponse.statusCode == 200) {
        quizStudentPostModel = QuizzesStudentPostModel.fromJson(json);

        emit(QuizzesSuccessState(quiz: quizStudentPostModel!));
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      emit(QuizzesErrorState(e.toString()));
    }
  }

  // List<QModel> q = [
  //   QModel(
  //       id: 1,
  //       question: "Taylor Swift ____ the music industry",
  //       answer: 1,
  //       options: [
  //         Option(text: 'am', isClicked: false),
  //         Option(text: 'is', isClicked: false),
  //         Option(text: 'are', isClicked: false)
  //       ],
  //       isSelected: false),
  //   QModel(
  //       id: 2,
  //       question: "Flutter from  ",
  //       answer: 1,
  //       options: [
  //         Option(text: 'Apple', isClicked: false),
  //         Option(text: 'Chrome', isClicked: false),
  //         Option(text: 'Google', isClicked: false)
  //       ],
  //       isSelected: false),
  //   QModel(
  //       id: 3,
  //       options: [
  //         Option(text: 'Apple', isClicked: false),
  //         Option(text: 'Facebook', isClicked: false),
  //         Option(text: 'Google', isClicked: false)
  //       ],
  //       answer: 3,
  //       question: "Flutter is open source",
  //       isSelected: false),
  //   QModel(
  //       id: 4,
  //       options: [
  //         Option(text: 'is', isClicked: false),
  //         Option(text: 'am', isClicked: false),
  //         Option(text: 'are', isClicked: false)
  //       ],
  //       answer: 2,
  //       question: "I _____ a doctor",
  //       isSelected: false),
  //   QModel(
  //       id: 5,
  //       options: [
  //         Option(text: 'am', isClicked: false),
  //         Option(text: 'is', isClicked: false),
  //         Option(text: 'are', isClicked: false)
  //       ],
  //       answer: 2,
  //       question: "This _____ a circle",
  //       isSelected: false),
  //   QModel(
  //       id: 6,
  //       question: "Best State Mangement  is ",
  //       answer: 1,
  //       options: [
  //         Option(text: 'Bloc', isClicked: false),
  //         Option(text: 'GetX', isClicked: false),
  //         Option(text: 'Provider', isClicked: false)
  //       ],
  //       isSelected: false),
  // ];

  void minusCounter() {
    if (count > 1) count--;
    emit(CounterMinus());
  }

  int counterOfQuestion = 6;

  // int get _counterOfQuestion => counterOfQuestion;
  int count = 1;

  void counter() {
    if (count < quizStudentPostModel!.quiz.numberOfQuestions) count++;
    emit(CounterPlus());
  }

  // List<QModel> get questionsList => [...q];

//To check if the answer is pressed

  double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int countOfCorrectAnswers = 0;

  getIcon(Questions model, int answerIndex) {
    if (answerIndex == model.answer) {
      return Icons.done;
    } else if (model.answer != answerIndex) {
      return Icons.close;
    } else {
      return Icons.close;
    }
  }

  void checkAnswer(Questions questionModel, int selectedAnswer) {
    questionModel.isSelected = true;
    questionModel.options[selectedAnswer].isSelected = true;
    if (selectedAnswer + 1 == questionModel.answer) {
      countOfCorrectAnswers++;
      print(countOfCorrectAnswers);
    }
    emit(CheckStateAnswer());
  }

  int? index;

  int answerIndex(index) {
    this.index = index;
    return index;
  }

  getColor(Questions model, int answerIndex) {
    if (model.isSelected == true) {
      if (model.answer == answerIndex) {
        return Colors.green.shade700;
      } else {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  //unsolved
  List<UnSolvedListModel>? unSolveStudent;

  Future<void> getListUnSolved() async {
    if (unSolveStudent != null) unSolveStudent = null;
    emit(QuizzesGetListUnSolvedLoadingState());
    try {
      var request = await http.get(
          Uri.parse(
              'https://new-school-management-system.onrender.com/mob/get_student_quiz'),
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          });
      Map<String, dynamic> json = await jsonDecode(request.body);
      print(json);
      if (request.statusCode == 201) {
        unSolveStudent = (json['quizzes'] as List)
            .map((e) => UnSolvedListModel.fromJson(e))
            .toList();
        emit(QuizzesGetListUnSolvedSuccessState(unSolveList: unSolveStudent!));
      }
    } catch (e) {
      emit(QuizzesGetListUnSolvedErrorState(e.toString()));
    }
  }

  //submit quiz
  void submissionResult(SubmissionModel submissionModel) async {
    emit(SubmissionQuizzesLoadingState());

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://new-school-management-system.onrender.com/mob/submission"),
      );
      request.fields.addAll({
        'quiz_id': submissionModel.quizId.toString(),
        'number_of_correct_answers': submissionModel.numberOfCorrectAnswer,
        'submit_duration': submissionModel.submitDuration,
        'duration': submissionModel.duration,
      });

      request.headers.addAll({
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      });
// we send request in this line
      final response = await request.send();
      var responseString = await response.stream.bytesToString();
      final myResponse = http.Response(responseString, response.statusCode);
      final json = jsonDecode(myResponse.body);

      print(json);
      print(myResponse.statusCode);

      if (myResponse.statusCode == 201) {
        emit(SubmissionQuizzesSuccessState());
      } else {
        throw Exception(json['message']);
      }
    } catch (e) {
      emit(SubmissionQuizzesErrorState(errorSubmission: e.toString()));
    }
  }
}
