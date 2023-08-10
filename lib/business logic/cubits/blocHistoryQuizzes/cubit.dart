import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocHistoryQuizzes/state.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/get_list_teacher_quizzes_history_model.dart';
import '../../../data/models/quizzes_history_student_model.dart';
import '../../../data/models/quizzes_history_teacher_post_model.dart';
import '../../../presentation/components and constants/constants.dart';

class QuizzesHistoryCubit extends Cubit<QuizzesHistoryState> {
  QuizzesHistoryCubit() : super(QuizzesHistoryGetListTeacherInitialState());

  static QuizzesHistoryCubit get(context) => BlocProvider.of(context);
  List<QuizzesHistoryTeacherGetModel>? quizzesHistoryTeacherGetModel;

  void getListQuizzesHistoryForTeacher() async {
    emit(QuizzesHistoryGetListTeacherLoadingState());
    try {
      var response = await http.get(
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/get_teacher_quiz_list'),
        headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );
      Map<String, dynamic> json = jsonDecode(response.body);
      print(response.body);
      print(json);
      if (response.statusCode == 200) {
        quizzesHistoryTeacherGetModel = (json['quizzes'] as List)
            .map((e) => QuizzesHistoryTeacherGetModel.fromJson(e))
            .toList();
        emit(QuizzesHistoryGetListTeacherSuccessState(
            quizzesHistoryTeacher: quizzesHistoryTeacherGetModel!));
      } else {
        throw Exception(json['message'] ?? "error");
      }
    } catch (e) {
      emit(QuizzesHistoryGetListTeacherErrorState(e.toString()));
    }
  }

  QuizzesHistoryTeacherQuestionPostModel?
      quizzesHistoryTeacherQuestionPostModel;

  void postTeacherQuizzesHistoryQuestion(int id) async {
    emit(TeacherQuizzesHistoryQuizzesLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/get_teacher_quiz'),
      );
      request.headers.addAll({
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      });
      request.fields.addAll({'quiz_id': id.toString()});
      final response = await request.send();
      var responseToString = await response.stream.bytesToString();
      final myResponse = http.Response(responseToString, response.statusCode);
      final json = jsonDecode(myResponse.body);
      print(json);
      if (myResponse.statusCode == 200) {
        quizzesHistoryTeacherQuestionPostModel =
            QuizzesHistoryTeacherQuestionPostModel.fromJson(json);
        emit(TeacherQuizzesHistoryQuizzesSuccessState(
            questionPostModel: quizzesHistoryTeacherQuestionPostModel!));
      } else {
        throw Exception(json['message'] ?? "error");
      }
    } catch (e) {
      emit(TeacherQuizzesHistoryQuizzesErrorState(
          errorHistoryTeacher: e.toString()));
    }
  }

  int counter = 1;

  void minusCounterTeacher() {
    if (counter > 1) counter--;
    emit(CounterMinusHistory());
  }


  void countTeacher() {
    int length=quizzesHistoryTeacherQuestionPostModel!.questions.questions.length;
    if (counter <
       length)
      counter++;


    emit(CounterPlusHistory());
  }

  List<QuizzesHistoryStudentGetModel>? quizzesHistoryS;

  Future<void> getListQuizzesHistoryStudent() async {
    emit(QuizzesHistoryGetListStudentLoadingState());
    try {
      var request = await http.get(
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/get_student_solved_quiz_list'),
        headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );
      Map<String, dynamic> json = jsonDecode(request.body);
      print(json);
      if (request.statusCode == 200) {
        quizzesHistoryS = (json['quizzes'] as List)
            .map((e) => QuizzesHistoryStudentGetModel.fromJson(e))
            .toList();
        emit(QuizzesHistoryGetListStudentSuccessState(
            quizzesHistoryStudentGetModel: quizzesHistoryS!));
      } else {
        throw Exception(json['message'] ?? "error");
      }
    } catch (e) {
      emit(QuizzesHistoryGetListStudentErrorState(e.toString()));
    }
  }

  QuizzesHistoryTeacherQuestionPostModel? quizzesHistoryStudentQuestionPM;

  void postStudentQuizzesHistoryQuestion(int id) async {
    emit(StudentQuizzesHistoryQuizzesLoadingState());
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://new-school-management-system.onrender.com/mob/get_student_solved_quiz'),
      );
      request.headers.addAll({
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Content-type': 'multipart/form-data'
      });
      request.fields.addAll({'quiz_id': id.toString()});
      final response = await request.send();
      var responseToString = await response.stream.bytesToString();
      final myResponse = http.Response(responseToString, response.statusCode);
      final json = jsonDecode(myResponse.body);
      print(json);
      if (myResponse.statusCode == 200) {
        quizzesHistoryStudentQuestionPM =
            QuizzesHistoryTeacherQuestionPostModel.fromJson(json);
        emit(StudentQuizzesHistoryQuizzesSuccessState(
            questionPostStudentModel: quizzesHistoryStudentQuestionPM!));
      } else {
        throw Exception(json['message'] ?? "error");
      }
    } catch (e) {
      emit(StudentQuizzesHistoryQuizzesErrorState(
          errorHistoryStudent: e.toString()));
    }
  }

  int counterStudent = 1;

  void minusCounterStudent() {
    if (counterStudent > 1) counterStudent--;
    emit(CounterMinusHistory());
  }


  void countStudent() {
    int length=quizzesHistoryStudentQuestionPM!.questions.questions.length;
    if (counterStudent <
        length)
      counterStudent++;


    emit(CounterPlusHistory());
  }
}
