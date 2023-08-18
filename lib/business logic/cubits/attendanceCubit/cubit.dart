
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/attendanceCubit/states.dart';
import '../../../data/models/get_absent_students_model.dart';
import 'package:http/http.dart' as http;
import '../../../presentation/components and constants/constants.dart';


class SectionAttendanceCubit extends Cubit<SectionAttendanceStates>
{
  SectionAttendanceCubit():super(SectionAttendanceInitialState());

  static SectionAttendanceCubit get(context)=>BlocProvider.of(context);

  DateTime today=DateTime.now();
  String? gradeSection;
  Future changeGrade(gradeSection)async
  {
    this.gradeSection=gradeSection;
    emit(GradeChangeState());
  }
   void onDaySelected(DateTime day,DateTime focusedDay)
  {
      today=day;
      print(today);
      getAbsentStudent(grade: gradeSection,date: today);
      emit(SectionAttendanceOnSelectedDayState());
  }

  List<String> emptyAbsent=[];
  GetAbsentStudents? getAbsentStudents;
  Future getAbsentStudent({grade,date})async
  {
    if(getAbsentStudents!=null)
    {
      getAbsentStudents=null;
    }
    emit(GetStudentsAbsenceLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/show_section_absence'));
    request.fields.addAll({
      'date': today.toString().split(" ")[0],
      'grade_section': grade
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 201) {
      print(grade);
      //print(section);
      getAbsentStudents=GetAbsentStudents.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(response.statusCode);
      print(getAbsentStudents?.toJson().toString());
      emit(GetStudentsAbsenceSuccessState(getAbsentStudents!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(response.statusCode);
      print(error);
      emit(GetStudentsAbsenceErrorState(error));
    }

  }

}