import 'package:mobile_schoolapp/data/models/quizzes_get_student_model.dart';

import '../../../data/models/get_unsolved_list_model.dart';


abstract class QuizState {}

class InitialStateQuizzes extends QuizState {}

class CheckStateAnswer extends QuizState {}

class ColorState extends QuizState {}

class CounterPlus extends QuizState {}

class CounterMinus extends QuizState {}

class ChangeAnswerIndex extends QuizState {}

class ClickState extends QuizState {}

class QuizTimerStartState extends QuizState {}

class QuizTimerCountdownState extends QuizState {}

class QuizTimerEndState extends QuizState {}

class QuizzesSuccessState extends QuizState {
  QuizzesStudentPostModel quiz;

  QuizzesSuccessState({required this.quiz});
}

class QuizzesErrorState extends QuizState {
  final String error;

  QuizzesErrorState(this.error);
}

class QuizzesLoadingState extends QuizState {}

class QuizzesGetListUnSolvedLoadingState extends QuizState {}

class QuizzesGetListUnSolvedSuccessState extends QuizState {
  List<UnSolvedListModel> unSolveList;

  QuizzesGetListUnSolvedSuccessState({required this.unSolveList});
}

class QuizzesGetListUnSolvedErrorState extends QuizState {
  final String errorUnSolve;

  QuizzesGetListUnSolvedErrorState(this.errorUnSolve);
}
