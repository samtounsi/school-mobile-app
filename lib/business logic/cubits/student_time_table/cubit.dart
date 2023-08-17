
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/student_time_table/states.dart';

import '../../../data/models/section_timetable.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;

class StudentTimetableCubit extends Cubit<StudentTimetableStates>
{
  StudentTimetableCubit() : super(StudentTimetableInitialState());
  static StudentTimetableCubit get(context) => BlocProvider.of(context);

  SectionTimetable? sectionTimetable;
  SectionTimetable? emptyTable;
  Future getSectionTimetable({required gradeSection})async
  {
    emit(GetSectionTimetableLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_student_time_table'));
    request.fields.addAll({
'grade_section': gradeSection
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      sectionTimetable = SectionTimetable.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(sectionTimetable?.toJson().toString());
      emit(GetSectionTimetableSuccessState(sectionTimetable!));
    }
    else if(response.statusCode==400)
    {
      if(sectionTimetable!=null)
      {
        sectionTimetable=null;
      }
     emptyTable=SectionTimetable
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
     emit(GetSectionTimetableEmptyState(emptyTable!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      print(response.statusCode);
      emit(GetSectionTimetableErrorState(error));
    }
  }


  SectionTimetable? studentTimetable;

  Future getStudentTimetable()async
  {
    emit(GetStudentTimetableLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_student_time_table'));

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      studentTimetable=SectionTimetable.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(studentTimetable?.toJson().toString());
      emit(GetStudentTimetableSuccessState(studentTimetable!));
  }
    else if(response.statusCode==400||response.statusCode==401)
    {
      if(studentTimetable!=null)
      {
        studentTimetable=null;
      }
      emptyTable=SectionTimetable
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
          technologyTeacher:' ',
        message: 'Time table hasn\'t been added yet!!'
      );
      emit(GetStudentTimetableEmptyState(emptyTable!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(GetStudentTimetableErrorState(error));
    }

  }

  SectionTimetable? parentStudentTimetable;
  Future getParentStudentTimetable({required int id})async
  {
    emit(GetParentStudentTimetableLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_student_time_table'));
    request.fields.addAll({
      'student_id': id.toString()
    });
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      parentStudentTimetable=SectionTimetable.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(parentStudentTimetable?.toJson().toString());
      emit(GetParentStudentTimetableSuccessState(parentStudentTimetable!));
    }
    else if(response.statusCode==400||response.statusCode==401)
    {
      if(parentStudentTimetable!=null)
      {
        parentStudentTimetable=null;
      }
      emptyTable=SectionTimetable
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
          technologyTeacher:' ',
          message: 'Time table hasn\'t been added yet!!'
      );
      emit(GetParentStudentTimetableEmptyState(emptyTable!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(GetParentStudentTimetableErrorState(error));
    }

  }
}