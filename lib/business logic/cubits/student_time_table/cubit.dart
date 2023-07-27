
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/student_time_table/states.dart';

import '../../../data/models/student_time_table.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;

class StudentTimetableCubit extends Cubit<StudentTimetableStates>
{
  StudentTimetableCubit() : super(StudentTimetableInitialState());
  static StudentTimetableCubit get(context) => BlocProvider.of(context);

  StudentTimetable? studentTimetable;
  StudentTimetable? emptyTable;
  Future getStudentsTimetable()async
  {
    emit(GetStudentTimetableLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(
        'https://new-school-management-system.onrender.com/mob/get_student_time_table'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      studentTimetable = StudentTimetable.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(studentTimetable?.toJson().toString());
      emit(GetStudentTimetableSuccessState(studentTimetable!));
    }
    else if(response.statusCode==400)
    {
     emptyTable=StudentTimetable
       (
         exist: 0,
         daysLessons:  [
           DaysLessons( day: "Sun",
               first: " ",
               second: " ",
               third: " ",
               fourth: " ",
               fifth: " ",
               sixth: " "),
           DaysLessons( day: "Mon",
               first: " ",
               second: " ",
               third: " ",
               fourth: " ",
               fifth: " ",
               sixth: " "),
           DaysLessons( day: "Tue",
               first: " ",
               second: " ",
               third: " ",
               fourth: " ",
               fifth: " ",
               sixth: " "),
           DaysLessons( day: "Wed",
               first: " ",
               second: " ",
               third: " ",
               fourth: " ",
               fifth: " ",
               sixth: " "),
           DaysLessons( day: "Thu",
               first: " ",
               second: " ",
               third: " ",
               fourth: " ",
               fifth: " ",
               sixth: " "),
         ],
          arabicTeacher:' ',
         englishTeacher:' ',
          frenchTeacher:' ',
          mathTeacher:' ',
           physicsTeacher:' ',
      chemistryTeacher: ' ',
          artTeacher: ' ',
         musicTeacher:' ',
          sportsTeacher:' ',
     socialTeacher:' ',
      cultureTeacher:' ',
          religionTeacher:' ',
          philosophyTeacher:' ',
          scienceTeacher:' ',
          technologyTeacher:' '
       );
     emit(GetStudentTimetableEmptyState(emptyTable!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(GetStudentTimetableErrorState(error));
    }
  }
}