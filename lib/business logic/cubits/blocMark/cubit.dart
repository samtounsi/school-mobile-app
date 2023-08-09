import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_schoolapp/business%20logic/cubits/blocMark/states.dart';
import '../../../data/models/add_marks_model.dart';
import '../../../data/models/get_students_marks_model.dart';
import '../../../data/models/get_students_model.dart';
import '../../../data/models/show_student_marks_model.dart';
import '../../../presentation/components and constants/constants.dart';
import 'package:http/http.dart' as http;

class MarksCubit extends Cubit<MarksStates> {
  MarksCubit() :super(MarksInitialState());

  static MarksCubit get(context) => BlocProvider.of(context);


  List<Mark>m=[];
  Future addStudentsMarks({required List students,required List marks})async
  {
    for(int i=0;i<students.length;i++)
    {
        m.add(Mark(studentName: students[i],  mark:int.parse(marks[i].text)) );
        print(m[i].studentName.toString());
        print(m[i].mark.toString());
    }
  }

  GetStudentsModel? getStudentsModel;
  Future getStudentsNames()async
  {
    emit(GetStudentsLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_students_names'));
    request.fields.addAll({
      'section': '1',
      'grade': 'seventh'
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      getStudentsModel=GetStudentsModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      emit(GetStudentsSuccessState(getStudentsModel!));
    }
  else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      emit(GetStudentsErrorState(error));
      }
  }

  Future postStudentsMarks({required AddMarksModel data})async
  {
    emit(AddStudentMarksLoadingState());
    var request = http.post(Uri.parse('https://new-school-management-system.onrender.com/mob/add_marks'),headers:{
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    },
        body: jsonEncode(data.toJson(model: data))
    );

   var response = await request;

    if (response.statusCode == 200) {
      print(jsonDecode(await response.body));
      emit(AddStudentMarksSuccessState());
  }
  else {
     String error= jsonDecode(await response.body)['message'];
      emit(AddStudentMarksErrorState(error));
  }

  }

  GetStudentsMarksModel? getStudentsMarksModel;
  Future getStudentsMarks(
  {
    required String gradeSection,
    required String semester,
    required String type,
    required String subject
  })async
  {
    emit(GetMarksLoadingState());
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_marks'));
    request.body = json.encode({
      "semester": semester,
      "subject": subject,
      "type": type,
      "grade_section":  gradeSection
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200||response.statusCode==401) {
      getStudentsMarksModel=GetStudentsMarksModel.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(getStudentsMarksModel?.toJson().toString());
      emit(GetMarksSuccessState(getStudentsMarksModel!));
    }
  else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(GetMarksErrorState(error));
  }

  }

  StudentMarks? studentMarks;
  Future getStudentMarks({required String semester,required type, required int  id})async
  {
    emit(GetStudentMarksLoadingState());
    var headers = {
      'Authorization': 'Bearer $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://new-school-management-system.onrender.com/mob/get_student_marks'));
    request.fields.addAll({
      'student_id': id.toString(),
      'test_type': type,
      'semester': semester.toString()
    });

    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 201)
    {
      studentMarks=StudentMarks.fromJson(jsonDecode(await response.stream.bytesToString()));
      print(studentMarks?.toJson().toString());
      emit(GetStudentMarksSuccessState(studentMarks!));
    }
    else {
      String error=jsonDecode(await response.stream.bytesToString())['message'];
      print(error);
      emit(GetStudentMarksErrorState(error));
    }

  }

}