import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocQuizzesStudent/stateQuizzes.dart';

import '../../../presentation/classes/quizzesStudent.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(InitialStateQuizzes()) {
    startTimer();
  }

  //Timer
  Timer? countdown;
  Duration myDur = Duration(hours: 1);
  int reduction = 1;

  void countDown() {
    final seconds = myDur.inSeconds - reduction;
    if (seconds == 30) {
      //popup that we're almost done
    }
    if (seconds < 0) {
      stopTimer();
      //maybe a pop up telling the user that the quiz is done
      //then
      //move to scoreboard
    } else {
      myDur = Duration(seconds: seconds);
    }
    emit(QuizTimerCountdownState());
  }

  void startTimer() {
    emit(QuizTimerStartState());
    countdown =
        Timer.periodic(Duration(seconds: reduction), (timer) => countDown());
  }

  void stopTimer() {
    emit(QuizTimerEndState());
    countdown!.cancel();
  }

  String showHours() {
    String hours = myDur.inHours.remainder(24).toString().padLeft(2, '0');
    return '${hours}';
  }

  String showMinutes() {
    String minutes = myDur.inMinutes.remainder(60).toString().padLeft(2, '0');
    return '${minutes}';
  }

  String showSeconds() {
    String seconds = myDur.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${seconds}';
  }

  //Quiz
  static QuizCubit get(context) => BlocProvider.of(context);
  List<QModel> q = [
    QModel(
        id: 1,
        question: "Taylor Swift ____ the music industry",
        answer: 1,
        options: [
          Option(text: 'am', isClicked: false),
          Option(text: 'is', isClicked: false),
          Option(text: 'are', isClicked: false)
        ],
        isSelected: false),
    QModel(
        id: 2,
        question: "Flutter from  ",
        answer: 1,
        options: [
          Option(text: 'Apple', isClicked: false),
          Option(text: 'Chrome', isClicked: false),
          Option(text: 'Google', isClicked: false)
        ],
        isSelected: false),
    QModel(
        id: 3,
        options: [
          Option(text: 'Apple', isClicked: false),
          Option(text: 'Facebook', isClicked: false),
          Option(text: 'Google', isClicked: false)
        ],
        answer: 3,
        question: "Flutter is open source",
        isSelected: false),
    QModel(
        id: 4,
        options: [
          Option(text: 'is', isClicked: false),
          Option(text: 'am', isClicked: false),
          Option(text: 'are', isClicked: false)
        ],
        answer: 2,
        question: "I _____ a doctor",
        isSelected: false),
    QModel(
        id: 5,
        options: [
          Option(text: 'am', isClicked: false),
          Option(text: 'is', isClicked: false),
          Option(text: 'are', isClicked: false)
        ],
        answer: 2,
        question: "This _____ a circle",
        isSelected: false),
    QModel(
        id: 6,
        question: "Best State Mangement  is ",
        answer: 1,
        options: [
          Option(text: 'Bloc', isClicked: false),
          Option(text: 'GetX', isClicked: false),
          Option(text: 'Provider', isClicked: false)
        ],
        isSelected: false),
  ];
  void minusCounter()
  {
    if(count>1) count--;
    emit(CounterMinus());

  }

  int counterOfQuestion = 6;

  int get _counterOfQuestion => counterOfQuestion;
  int count = 1;

  void counter() {
    if (count < counterOfQuestion) count++;
    emit(CounterPlus());
  }

  List<QModel> get questionsList => [...q];

//To check if the answer is pressed

  double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int countOfCorrectAnswers = 0;

  getIcon(QModel model, int answerIndex) {
    if (answerIndex == model.answer) {
      return Icons.done;
    } else if (model.answer != answerIndex) {
      return Icons.close;
    } else {
      return Icons.close;
    }
  }

  void checkAnswer(QModel questionModel, int selectedAnswer, bool isSelected) {
    questionModel.isSelected = true;
    questionModel.options[selectedAnswer].isClicked = true;
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

  getColor(QModel model, int answerIndex) {
    if (model.isSelected == true) {
      if (model.answer == answerIndex) {
        return Colors.green.shade700;
      } else {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }
}
