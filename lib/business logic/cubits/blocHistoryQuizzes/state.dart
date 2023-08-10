

import '../../../data/models/get_list_teacher_quizzes_history_model.dart';
import '../../../data/models/quizzes_history_student_model.dart';
import '../../../data/models/quizzes_history_teacher_post_model.dart';

abstract class QuizzesHistoryState {}

class QuizzesHistoryGetListTeacherInitialState extends QuizzesHistoryState {}

class QuizzesHistoryGetListTeacherSuccessState extends QuizzesHistoryState {
  List<QuizzesHistoryTeacherGetModel> quizzesHistoryTeacher;

  QuizzesHistoryGetListTeacherSuccessState(
      {required this.quizzesHistoryTeacher});
}

class QuizzesHistoryGetListTeacherLoadingState extends QuizzesHistoryState {}

class QuizzesHistoryGetListTeacherErrorState extends QuizzesHistoryState {
  final String error;

  QuizzesHistoryGetListTeacherErrorState(this.error);
}

//state quizzes history question teacher
class TeacherQuizzesHistoryQuizzesSuccessState extends QuizzesHistoryState {
  QuizzesHistoryTeacherQuestionPostModel questionPostModel;

  TeacherQuizzesHistoryQuizzesSuccessState({required this.questionPostModel});
}

class TeacherQuizzesHistoryQuizzesLoadingState extends QuizzesHistoryState {}

class TeacherQuizzesHistoryQuizzesErrorState extends QuizzesHistoryState {
  final String errorHistoryTeacher;

  TeacherQuizzesHistoryQuizzesErrorState({required this.errorHistoryTeacher});
}

class CounterMinusHistory extends QuizzesHistoryState {}

class CounterPlusHistory extends QuizzesHistoryState {}

class QuizzesHistoryGetListStudentLoadingState extends QuizzesHistoryState {}

class QuizzesHistoryGetListStudentSuccessState extends QuizzesHistoryState {
  List<QuizzesHistoryStudentGetModel> quizzesHistoryStudentGetModel;

  QuizzesHistoryGetListStudentSuccessState(
      {required this.quizzesHistoryStudentGetModel});
}

class QuizzesHistoryGetListStudentErrorState extends QuizzesHistoryState {
  final String error;

  QuizzesHistoryGetListStudentErrorState(this.error);
}
class StudentQuizzesHistoryQuizzesSuccessState extends QuizzesHistoryState {
  QuizzesHistoryTeacherQuestionPostModel questionPostStudentModel;

  StudentQuizzesHistoryQuizzesSuccessState({required this.questionPostStudentModel});
}

class StudentQuizzesHistoryQuizzesLoadingState extends QuizzesHistoryState {}

class  StudentQuizzesHistoryQuizzesErrorState extends QuizzesHistoryState {
  final String errorHistoryStudent;

  StudentQuizzesHistoryQuizzesErrorState({required this.errorHistoryStudent});
}
